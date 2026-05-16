#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
OUT_DIR="$ROOT_DIR/outputs/melotts"
TEXTS="$ROOT_DIR/samples/test_texts.json"
mkdir -p "$OUT_DIR"

MELO_BIN="${MELO_BIN:-melo}"
if ! command -v "$MELO_BIN" >/dev/null 2>&1; then
  echo "melo CLI not found. Activate the MeloTTS environment or set MELO_BIN." >&2
  exit 1
fi

"$ROOT_DIR/scripts/run_melotts_cli.py" --texts "$TEXTS" --out-dir "$OUT_DIR" --melo-bin "$MELO_BIN"
