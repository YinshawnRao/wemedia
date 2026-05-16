#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"

if [[ $# -ne 4 ]]; then
  echo "Usage: $0 <youtube_url> <slug> <start> <end>" >&2
  echo "Example: $0 'https://www.youtube.com/watch?v=VIDEO_ID' 'topic_slug' '00:01:20' '00:02:05'" >&2
  exit 1
fi

URL="$1"
SLUG="$(safe_slug "$2")"
START="$3"
END="$4"
SAFE_START="$(safe_time "$START")"
SAFE_END="$(safe_time "$END")"
OUT_DIR="${CLIPS_DIR}/${SLUG}"

init_dirs
ensure_tools
mkdir -p "$OUT_DIR"

ARGS=(
  "${BASE_ARGS[@]}"
  "${VIDEO_ARGS[@]}"
  "${METADATA_ARGS[@]}"
  --download-sections "*${START}-${END}"
  --force-keyframes-at-cuts
  -o "${OUT_DIR}/%(upload_date)s_%(uploader)s_%(title)s_%(id)s_clip_${SAFE_START}_${SAFE_END}.%(ext)s"
)

if [[ ! -f "$CLIP_LOG" ]]; then
  printf "timestamp\tslug\tstart\tend\turl\n" >> "$CLIP_LOG"
fi
printf "%s\t%s\t%s\t%s\t%s\n" "$(date -u +"%Y-%m-%dT%H:%M:%SZ")" "$SLUG" "$START" "$END" "$URL" >> "$CLIP_LOG"

run_ytdlp "clip" "$OUT_DIR" "$URL" "${ARGS[@]}" "$URL"
