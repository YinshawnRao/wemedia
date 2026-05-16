#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"

echo "Project: ${ROOT_DIR}"
echo "Output mode: ${OUTPUT_MODE}"
echo "Output root: ${YTDLP_OUTPUT_ROOT}"
if [[ -n "$COOKIES_FILE" ]]; then
  echo "Cookies: file ${COOKIES_FILE}"
else
  echo "Cookies: browser ${COOKIES_BROWSER}"
fi
echo "yt-dlp: $(command -v "$YTDLP_BIN")"
"$YTDLP_BIN" --version
echo "ffmpeg: $(command -v ffmpeg)"
ffmpeg -version | sed -n '1p'
echo "node: $(command -v "$JS_RUNTIME")"
"$JS_RUNTIME" --version
if command -v deno >/dev/null 2>&1; then
  echo "deno: $(command -v deno)"
else
  echo "deno: not installed"
fi
