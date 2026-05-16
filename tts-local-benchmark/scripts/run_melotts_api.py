#!/usr/bin/env python3
import argparse
import json
import time
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--texts", default="samples/test_texts.json")
    parser.add_argument("--out-dir", default="outputs/melotts")
    parser.add_argument("--device", default="cpu")
    parser.add_argument("--limit", type=int, default=6)
    args = parser.parse_args()

    root = Path(__file__).resolve().parents[1]
    texts = json.loads((root / args.texts).read_text(encoding="utf-8"))
    out_dir = root / args.out_dir
    out_dir.mkdir(parents=True, exist_ok=True)

    print(f"Loading MeloTTS language=ZH device={args.device}...", flush=True)
    from melo.api import TTS

    model = TTS(language="ZH", device=args.device)
    speaker_ids = model.hps.data.spk2id
    speaker_id = speaker_ids["ZH"]
    print(f"MeloTTS loaded. speaker_id={speaker_id}", flush=True)

    status = {"engine": "melotts", "generated_files": [], "latencies": {}, "errors": []}
    for sample_id, text in list(texts.items())[: args.limit]:
        out_path = out_dir / f"melotts_{sample_id}.wav"
        print(f"Rendering sample={sample_id}", flush=True)
        start = time.perf_counter()
        try:
            model.tts_to_file(text, speaker_id, str(out_path), speed=1.0)
            elapsed = time.perf_counter() - start
            status["generated_files"].append(str(out_path))
            status["latencies"][out_path.name] = round(elapsed, 3)
        except Exception as exc:
            status["errors"].append({"sample_id": sample_id, "error": repr(exc)})

    speed_path = out_dir / "melotts_short_intro_speed115.wav"
    print("Rendering sample=short_intro speed=1.15", flush=True)
    start = time.perf_counter()
    try:
        model.tts_to_file(texts["short_intro"], speaker_id, str(speed_path), speed=1.15)
        elapsed = time.perf_counter() - start
        status["generated_files"].append(str(speed_path))
        status["latencies"][speed_path.name] = round(elapsed, 3)
    except Exception as exc:
        status["errors"].append({"sample_id": "short_intro_speed115", "error": repr(exc)})

    status["run_status"] = "success" if status["generated_files"] else "failed"
    (out_dir / "status.json").write_text(json.dumps(status, ensure_ascii=False, indent=2), encoding="utf-8")
    print(json.dumps(status, ensure_ascii=False, indent=2))
    return 0 if status["generated_files"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
