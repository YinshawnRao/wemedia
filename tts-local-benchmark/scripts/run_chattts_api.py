#!/usr/bin/env python3
import argparse
import json
import time
import urllib.parse
import urllib.request
from pathlib import Path


def post_json(url: str, payload: dict):
    data = json.dumps(payload, ensure_ascii=False).encode("utf-8")
    req = urllib.request.Request(url, data=data, headers={"Content-Type": "application/json"})
    return urllib.request.urlopen(req, timeout=300)


def download(url: str, out_path: Path) -> None:
    with urllib.request.urlopen(url, timeout=300) as resp:
        out_path.write_bytes(resp.read())


def extract_audio(resp, base_url: str, out_path: Path) -> dict:
    content_type = resp.headers.get("Content-Type", "")
    body = resp.read()
    if "audio" in content_type or body[:4] == b"RIFF":
        out_path.write_bytes(body)
        return {"kind": "audio_body"}

    text = body.decode("utf-8", errors="replace")
    data = json.loads(text)
    candidates = []
    for key in ("audio", "audio_url", "url", "filename", "file", "path", "wav"):
        value = data.get(key)
        if isinstance(value, str) and value:
            candidates.append(value)
    nested = data.get("data")
    if isinstance(nested, dict):
        for key in ("audio", "audio_url", "url", "filename", "file", "path", "wav"):
            value = nested.get(key)
            if isinstance(value, str) and value:
                candidates.append(value)

    for value in candidates:
        if value.startswith("http://") or value.startswith("https://"):
            download(value, out_path)
            return {"kind": "json_url", "source": value}
        if value.startswith("/"):
            full_url = urllib.parse.urljoin(base_url, value)
            download(full_url, out_path)
            return {"kind": "json_relative_url", "source": full_url}
        candidate_path = Path(value)
        if candidate_path.exists():
            out_path.write_bytes(candidate_path.read_bytes())
            return {"kind": "json_local_path", "source": value}

    raise RuntimeError(f"Cannot find audio in response: {text[:1000]}")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--base-url", default="http://127.0.0.1:9966")
    parser.add_argument("--texts", default="samples/test_texts.json")
    parser.add_argument("--out-dir", default="outputs/chattts-ui")
    parser.add_argument("--limit", type=int, default=2)
    args = parser.parse_args()

    root = Path(__file__).resolve().parents[1]
    texts = json.loads((root / args.texts).read_text(encoding="utf-8"))
    out_dir = root / args.out_dir
    out_dir.mkdir(parents=True, exist_ok=True)
    voices = ["2222", "7869", "6653"]
    status = {"engine": "chattts-ui", "generated_files": [], "latencies": {}, "errors": []}

    for voice in voices:
        for sample_id, text in list(texts.items())[: args.limit]:
            out_path = out_dir / f"chattts-ui_voice{voice}_{sample_id}.wav"
            payload = {
                "text": text,
                "voice": voice,
                "prompt": "[oral_2][break_4]",
                "temperature": 0.3,
                "top_p": 0.7,
                "top_k": 20,
                "skip_refine": 0,
                "custom_voice": 0,
            }
            try:
                start = time.perf_counter()
                resp = post_json(urllib.parse.urljoin(args.base_url, "/tts"), payload)
                meta = extract_audio(resp, args.base_url, out_path)
                elapsed = time.perf_counter() - start
                status["generated_files"].append(str(out_path))
                status["latencies"][out_path.name] = round(elapsed, 3)
                status.setdefault("response_meta", {})[out_path.name] = meta
            except Exception as exc:
                status["errors"].append({"voice": voice, "sample_id": sample_id, "error": repr(exc)})

    status["run_status"] = "success" if status["generated_files"] else "failed"
    (out_dir / "status.json").write_text(json.dumps(status, ensure_ascii=False, indent=2), encoding="utf-8")
    print(json.dumps(status, ensure_ascii=False, indent=2))
    return 0 if status["generated_files"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
