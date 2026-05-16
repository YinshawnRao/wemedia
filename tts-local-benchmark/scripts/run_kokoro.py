#!/usr/bin/env python3
import argparse
import json
import time
from pathlib import Path


def load_texts(path: Path) -> dict[str, str]:
    return json.loads(path.read_text(encoding="utf-8"))


def write_wav(path: Path, chunks, sample_rate: int) -> None:
    import numpy as np
    import soundfile as sf

    path.parent.mkdir(parents=True, exist_ok=True)
    if len(chunks) == 1:
      audio = chunks[0]
    else:
      audio = np.concatenate(chunks)
    sf.write(path, audio, sample_rate)


def synthesize(pipeline, text: str, voice: str, speed: float):
    chunks = []
    for _, _, audio in pipeline(text, voice=voice, speed=speed):
        chunks.append(audio)
    return chunks, 24000


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--texts", default="samples/test_texts.json")
    parser.add_argument("--out-dir", default="outputs/kokoro")
    parser.add_argument("--limit", type=int, default=6)
    parser.add_argument("--voices", nargs="*", default=["zf_xiaoyi", "zm_yunxi", "zf_xiaoni", "zm_yunjian", "zm_yunyang"])
    args = parser.parse_args()

    root = Path(__file__).resolve().parents[1]
    texts = load_texts((root / args.texts).resolve())
    out_dir = (root / args.out_dir).resolve()
    from kokoro import KPipeline

    print("Initializing Kokoro KPipeline(lang_code='z')...", flush=True)
    pipeline = KPipeline(lang_code="z")
    print("Kokoro pipeline initialized.", flush=True)
    status = {
        "engine": "kokoro",
        "attempt": "official pip kokoro>=0.9.4 with misaki[zh]",
        "generated_files": [],
        "voice_errors": {},
        "latencies": {},
    }

    selected_items = list(texts.items())[: args.limit]
    working_voices = []
    for voice in args.voices:
        try:
            sample_id, text = selected_items[0]
            print(f"Testing voice={voice} sample={sample_id}", flush=True)
            start = time.perf_counter()
            chunks, sample_rate = synthesize(pipeline, text, voice, 1.0)
            elapsed = time.perf_counter() - start
            out_path = out_dir / f"kokoro_{voice}_{sample_id}.wav"
            write_wav(out_path, chunks, sample_rate)
            print(f"Wrote {out_path}", flush=True)
            status["generated_files"].append(str(out_path))
            status["latencies"][out_path.name] = round(elapsed, 3)
            working_voices.append(voice)
            if len(working_voices) >= 2:
                break
        except Exception as exc:
            status["voice_errors"][voice] = repr(exc)

    if not working_voices:
        (out_dir / "status.json").write_text(json.dumps(status, ensure_ascii=False, indent=2), encoding="utf-8")
        raise SystemExit("No Kokoro Chinese voice worked")

    for voice in working_voices:
        for sample_id, text in selected_items[1:]:
            print(f"Rendering voice={voice} sample={sample_id}", flush=True)
            start = time.perf_counter()
            chunks, sample_rate = synthesize(pipeline, text, voice, 1.0)
            elapsed = time.perf_counter() - start
            out_path = out_dir / f"kokoro_{voice}_{sample_id}.wav"
            write_wav(out_path, chunks, sample_rate)
            print(f"Wrote {out_path}", flush=True)
            status["generated_files"].append(str(out_path))
            status["latencies"][out_path.name] = round(elapsed, 3)

    speed_voice = working_voices[0]
    speed_text = texts["short_intro"]
    print(f"Rendering speed control voice={speed_voice} sample=short_intro speed=1.15", flush=True)
    start = time.perf_counter()
    chunks, sample_rate = synthesize(pipeline, speed_text, speed_voice, 1.15)
    elapsed = time.perf_counter() - start
    speed_path = out_dir / f"kokoro_{speed_voice}_short_intro_speed115.wav"
    write_wav(speed_path, chunks, sample_rate)
    status["generated_files"].append(str(speed_path))
    status["latencies"][speed_path.name] = round(elapsed, 3)

    status["working_voices"] = working_voices
    status["run_status"] = "success"
    (out_dir / "status.json").write_text(json.dumps(status, ensure_ascii=False, indent=2), encoding="utf-8")
    print(json.dumps(status, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
