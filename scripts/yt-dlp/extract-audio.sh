#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"

if [[ $# -lt 1 || $# -gt 3 ]]; then
  echo "Usage: $0 <youtube_url> [slug] [audio_format]" >&2
  echo "Example: $0 'https://www.youtube.com/watch?v=VIDEO_ID' 'topic_slug' mp3" >&2
  exit 1
fi

URL="$1"
SLUG="$(safe_slug "${2:-_inbox}")"
AUDIO_FORMAT="${3:-mp3}"
OUT_DIR="${AUDIO_DIR}/${SLUG}"

init_dirs
ensure_tools
mkdir -p "$OUT_DIR"

ARGS=(
  "${BASE_ARGS[@]}"
  -x
  --audio-format "$AUDIO_FORMAT"
  --audio-quality 0
  --download-archive "$AUDIO_ARCHIVE"
  -o "${OUT_DIR}/%(upload_date)s_%(uploader)s_%(title)s_%(id)s.%(ext)s"
)

run_ytdlp "extract-audio" "$OUT_DIR" "$URL" "${ARGS[@]}" "$URL"

