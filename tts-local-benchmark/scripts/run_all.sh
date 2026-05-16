#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
REPORT="$ROOT_DIR/report.md"

"$ROOT_DIR/scripts/check_env.sh" "$ROOT_DIR/env_report.md"

if [[ -x "$ROOT_DIR/vendor/kokoro-test/venv/bin/python" ]]; then
  "$ROOT_DIR/vendor/kokoro-test/venv/bin/python" "$ROOT_DIR/scripts/run_kokoro.py" || true
fi

if command -v melo >/dev/null 2>&1; then
  "$ROOT_DIR/scripts/run_melotts.sh" || true
fi

if [[ -x "$ROOT_DIR/vendor/melotts/venv/bin/python" ]]; then
  "$ROOT_DIR/vendor/melotts/venv/bin/python" "$ROOT_DIR/scripts/run_melotts_api.py" || true
fi

"$ROOT_DIR/scripts/compare_audio_info.py" --root "$ROOT_DIR" --report "$REPORT" || true
"$ROOT_DIR/scripts/make_demo_video.sh" || true
