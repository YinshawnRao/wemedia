#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
import logging
import re
import time
import warnings
from dataclasses import dataclass
from pathlib import Path

import numpy as np
import soundfile as sf
from kokoro import KPipeline


warnings.filterwarnings("ignore", category=UserWarning)
warnings.filterwarnings("ignore", category=FutureWarning)
logging.getLogger("jieba").setLevel(logging.ERROR)

ROOT_DIR = Path(__file__).resolve().parents[2]
CONFIG_PATH = ROOT_DIR / "config/tts/default-voiceover.json"


@dataclass
class Cue:
    cue_id: str
    text: str
    start: float | None = None
    end: float | None = None


def load_config(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def parse_timecode(value: str) -> float:
    match = re.match(r"^(\d{2}):(\d{2}):(\d{2})[,.](\d{3})$", value.strip())
    if not match:
        raise ValueError(f"Invalid SRT timecode: {value}")
    hours, minutes, seconds, millis = [int(part) for part in match.groups()]
    return hours * 3600 + minutes * 60 + seconds + millis / 1000


def parse_srt(path: Path) -> list[Cue]:
    blocks = re.split(r"\n\s*\n", path.read_text(encoding="utf-8").strip())
    cues: list[Cue] = []
    for idx, block in enumerate(blocks, start=1):
        lines = [line.strip() for line in block.splitlines() if line.strip()]
        if not lines:
            continue
        if "-->" in lines[0]:
            cue_id = str(idx)
            timing = lines[0]
            text_lines = lines[1:]
        else:
            cue_id = lines[0]
            timing = lines[1]
            text_lines = lines[2:]
        start_raw, end_raw = [part.strip() for part in timing.split("-->", 1)]
        text = " ".join(text_lines).strip()
        if text:
            cues.append(Cue(cue_id=cue_id, text=text, start=parse_timecode(start_raw), end=parse_timecode(end_raw)))
    return cues


def synthesize(pipeline: KPipeline, text: str, voice: str, speed: float) -> np.ndarray:
    chunks = []
    for _, _, audio in pipeline(text, voice=voice, speed=speed):
        chunks.append(audio)
    if not chunks:
        return np.zeros(0, dtype=np.float32)
    return np.concatenate(chunks).astype(np.float32)


def write_wav(path: Path, audio: np.ndarray, sample_rate: int) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    sf.write(path, audio, sample_rate)


def normalize_plain_text(value: str) -> str:
    return re.sub(r"\s+", " ", value).strip()


def read_input(args: argparse.Namespace) -> tuple[str, list[Cue]]:
    if args.srt:
        cues = parse_srt(Path(args.srt).resolve())
        return "srt", cues
    if args.text_file:
        text = Path(args.text_file).read_text(encoding="utf-8")
    else:
        text = args.text or ""
    text = normalize_plain_text(text)
    if not text:
        raise SystemExit("No text provided. Use --text, --text-file, or --srt.")
    return "single", [Cue(cue_id="001", text=text, start=0.0, end=None)]


def render_single(
    pipeline: KPipeline,
    cues: list[Cue],
    out_dir: Path,
    basename: str,
    voice: str,
    speed: float,
    sample_rate: int,
) -> tuple[Path, list[dict]]:
    cue = cues[0]
    start = time.perf_counter()
    audio = synthesize(pipeline, cue.text, voice, speed)
    elapsed = time.perf_counter() - start
    wav_path = out_dir / f"{basename}.wav"
    write_wav(wav_path, audio, sample_rate)
    return wav_path, [
        {
            "id": cue.cue_id,
            "text": cue.text,
            "file": str(wav_path),
            "duration": round(len(audio) / sample_rate, 3),
            "latency": round(elapsed, 3),
        }
    ]


def render_timeline(
    pipeline: KPipeline,
    cues: list[Cue],
    out_dir: Path,
    basename: str,
    voice: str,
    speed: float,
    sample_rate: int,
) -> tuple[Path, list[dict]]:
    segment_dir = out_dir / f"{basename}_segments"
    segment_dir.mkdir(parents=True, exist_ok=True)
    timeline = np.zeros(0, dtype=np.float32)
    cursor = 0
    manifest_items: list[dict] = []

    for index, cue in enumerate(cues, start=1):
        start = time.perf_counter()
        audio = synthesize(pipeline, cue.text, voice, speed)
        elapsed = time.perf_counter() - start
        segment_path = segment_dir / f"{index:03d}_{cue.cue_id}.wav"
        write_wav(segment_path, audio, sample_rate)

        target_start = cue.start or 0.0
        target_end = cue.end
        start_sample = max(int(target_start * sample_rate), cursor)
        end_sample = start_sample + len(audio)
        if end_sample > len(timeline):
            timeline = np.pad(timeline, (0, end_sample - len(timeline)))
        timeline[start_sample:end_sample] += audio
        cursor = end_sample + int(0.08 * sample_rate)

        generated_duration = len(audio) / sample_rate
        overrun = None
        if target_end is not None:
            overrun = max(0.0, start_sample / sample_rate + generated_duration - target_end)

        manifest_items.append(
            {
                "id": cue.cue_id,
                "text": cue.text,
                "segment_file": str(segment_path),
                "target_start": target_start,
                "target_end": target_end,
                "actual_start": round(start_sample / sample_rate, 3),
                "duration": round(generated_duration, 3),
                "overrun": round(overrun, 3) if overrun is not None else None,
                "latency": round(elapsed, 3),
            }
        )

    if len(timeline):
        peak = float(np.max(np.abs(timeline)))
        if peak > 0.98:
            timeline = timeline / peak * 0.98
    wav_path = out_dir / f"{basename}.wav"
    write_wav(wav_path, timeline, sample_rate)
    return wav_path, manifest_items


def main() -> int:
    parser = argparse.ArgumentParser(description="Render the project-default voiceover.")
    parser.add_argument("--text")
    parser.add_argument("--text-file")
    parser.add_argument("--srt")
    parser.add_argument("--out-dir")
    parser.add_argument("--basename", default="voiceover")
    parser.add_argument("--voice")
    parser.add_argument("--speed", type=float)
    parser.add_argument("--config", default=str(CONFIG_PATH))
    args = parser.parse_args()

    config = load_config(Path(args.config).resolve())
    voice = args.voice or config["voice"]
    speed = args.speed if args.speed is not None else float(config["speed"])
    sample_rate = int(config["sample_rate"])
    out_dir = Path(args.out_dir).resolve() if args.out_dir else ROOT_DIR / config["output_root"] / "manual"
    out_dir.mkdir(parents=True, exist_ok=True)

    mode, cues = read_input(args)
    pipeline = KPipeline(lang_code=config["lang_code"])
    if mode == "srt":
        wav_path, items = render_timeline(pipeline, cues, out_dir, args.basename, voice, speed, sample_rate)
    else:
        wav_path, items = render_single(pipeline, cues, out_dir, args.basename, voice, speed, sample_rate)

    manifest = {
        "engine": "kokoro",
        "profile_id": config["profile_id"],
        "voice": voice,
        "speed": speed,
        "sample_rate": sample_rate,
        "mode": mode,
        "wav_path": str(wav_path),
        "items": items,
    }
    manifest_path = out_dir / f"{args.basename}.manifest.json"
    manifest_path.write_text(json.dumps(manifest, ensure_ascii=False, indent=2), encoding="utf-8")
    print(json.dumps({"wav_path": str(wav_path), "manifest_path": str(manifest_path)}, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
