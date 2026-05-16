#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"

if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo "Usage: $0 <youtube_url> [slug]" >&2
  echo "Example: $0 'https://www.youtube.com/watch?v=VIDEO_ID' 'topic_slug'" >&2
  exit 1
fi

URL="$1"
SLUG="$(safe_slug "${2:-_inbox}")"
OUT_DIR="${SUBTITLES_DIR}/${SLUG}"

init_dirs
ensure_tools
mkdir -p "$OUT_DIR"

ARGS=(
  "${BASE_ARGS[@]}"
  --write-subs
  --write-auto-subs
  --sub-langs "$SUB_LANGS"
  --convert-subs srt
  --skip-download
  --download-archive "$SUBTITLE_ARCHIVE"
  -o "${OUT_DIR}/%(upload_date)s_%(uploader)s_%(title)s_%(id)s.%(ext)s"
)

run_ytdlp "download-subtitles" "$OUT_DIR" "$URL" "${ARGS[@]}" "$URL"

