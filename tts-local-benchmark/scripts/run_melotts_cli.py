#!/usr/bin/env python3
import argparse
import json
import subprocess
import time
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--texts", required=True)
    parser.add_argument("--out-dir", required=True)
    parser.add_argument("--melo-bin", default="melo")
    args = parser.parse_args()

    texts = json.loads(Path(args.texts).read_text(encoding="utf-8"))
    out_dir = Path(args.out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)
    status = {"engine": "melotts", "generated_files": [], "latencies": {}, "errors": []}

    for sample_id, text in texts.items():
        out_path = out_dir / f"melotts_{sample_id}.wav"
        cmd = [args.melo_bin, text, str(out_path), "-l", "ZH"]
        start = time.perf_counter()
        proc = subprocess.run(cmd, text=True, capture_output=True)
        elapsed = time.perf_counter() - start
        if proc.returncode != 0:
            status["errors"].append({"sample_id": sample_id, "stderr": proc.stderr[-2000:]})
            continue
        status["generated_files"].append(str(out_path))
        status["latencies"][out_path.name] = round(elapsed, 3)

    speed_path = out_dir / "melotts_short_intro_speed115.wav"
    speed_cmd = [args.melo_bin, texts["short_intro"], str(speed_path), "-l", "ZH", "-s", "1.15"]
    start = time.perf_counter()
    proc = subprocess.run(speed_cmd, text=True, capture_output=True)
    elapsed = time.perf_counter() - start
    if proc.returncode == 0:
        status["generated_files"].append(str(speed_path))
        status["latencies"][speed_path.name] = round(elapsed, 3)
    else:
        status["errors"].append({"sample_id": "short_intro_speed115", "stderr": proc.stderr[-2000:]})

    status["run_status"] = "success" if status["generated_files"] else "failed"
    (out_dir / "status.json").write_text(json.dumps(status, ensure_ascii=False, indent=2), encoding="utf-8")
    print(json.dumps(status, ensure_ascii=False, indent=2))
    return 0 if status["generated_files"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
