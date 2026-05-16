#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
PYTHON_BIN="$ROOT_DIR/tts-local-benchmark/vendor/kokoro-test/venv/bin/python"
SCRIPT="$ROOT_DIR/scripts/tts/render_default_voiceover.py"

if [[ ! -x "$PYTHON_BIN" ]]; then
  echo "Default voiceover runtime is missing: $PYTHON_BIN" >&2
  echo "Run the Kokoro benchmark setup first, or restore tts-local-benchmark/vendor/kokoro-test/venv." >&2
  exit 1
fi

exec "$PYTHON_BIN" "$SCRIPT" "$@"
