#!/usr/bin/env python3
import argparse
import json
import subprocess
from pathlib import Path


def probe(path: Path) -> dict:
    cmd = [
        "ffprobe",
        "-v",
        "error",
        "-show_entries",
        "format=duration:stream=sample_rate",
        "-of",
        "json",
        str(path),
    ]
    proc = subprocess.run(cmd, text=True, capture_output=True)
    if proc.returncode != 0:
        return {"duration": "unknown", "sample_rate": "unknown", "error": proc.stderr.strip()}
    data = json.loads(proc.stdout)
    duration = data.get("format", {}).get("duration")
    sample_rate = "unknown"
    for stream in data.get("streams", []):
        if stream.get("sample_rate"):
            sample_rate = stream["sample_rate"]
            break
    return {
        "duration": f"{float(duration):.2f}s" if duration else "unknown",
        "sample_rate": sample_rate,
    }


def build_table(root: Path) -> str:
    files = sorted(list((root / "outputs").glob("**/*.wav")) + list((root / "outputs").glob("**/*.mp3")))
    lines = [
        "## 音频文件信息附录",
        "",
        "| 文件 | 时长 | 采样率 | 大小 |",
        "|---|---:|---:|---:|",
    ]
    for path in files:
        info = probe(path)
        size_mb = path.stat().st_size / 1024 / 1024
        rel = path.relative_to(root)
        lines.append(f"| `{rel}` | {info['duration']} | {info['sample_rate']} Hz | {size_mb:.2f} MB |")
    if not files:
        lines.append("| 暂无音频 | - | - | - |")
    return "\n".join(lines) + "\n"


def replace_section(report: Path, section: str) -> None:
    marker = "<!-- AUDIO_INFO_APPENDIX -->"
    content = report.read_text(encoding="utf-8") if report.exists() else ""
    if marker in content:
        content = content.split(marker)[0].rstrip() + "\n\n" + marker + "\n\n" + section
    else:
        content = content.rstrip() + "\n\n" + marker + "\n\n" + section
    report.write_text(content, encoding="utf-8")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", default=str(Path(__file__).resolve().parents[1]))
    parser.add_argument("--report", default=None)
    args = parser.parse_args()
    root = Path(args.root).resolve()
    table = build_table(root)
    print(table)
    if args.report:
        replace_section(Path(args.report), table)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
