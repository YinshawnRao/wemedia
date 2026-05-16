#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
KOKORO_BIN="$ROOT_DIR/.venv-kokoro-runtime/bin/kokoro-tts"
MODEL="$ROOT_DIR/models/kokoro/kokoro-v1.0.onnx"
VOICES="$ROOT_DIR/models/kokoro/voices-v1.0.bin"

if [[ ! -x "$KOKORO_BIN" ]]; then
  echo "Kokoro is not installed at: $KOKORO_BIN" >&2
  exit 1
fi

if [[ ! -f "$MODEL" || ! -f "$VOICES" ]]; then
  echo "Kokoro model files are missing under: $ROOT_DIR/models/kokoro" >&2
  exit 1
fi

exec "$KOKORO_BIN" "$@" --model "$MODEL" --voices "$VOICES"
