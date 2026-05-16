#!/usr/bin/env bash
set -uo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
export WEMEDIA_OUTPUT_MODE=test
export YTDLP_FORMAT='bv*[height<=1080]+ba/b[height<=1080]/b'

download_clip() {
  local title="$1"
  local url="$2"
  local start="$3"
  local end="$4"

  printf "\n[%s] %s -> %s\n" "$title" "$start" "$end"
  "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-016" "$start" "$end"
}

failures=0

download_clip "Top5-无法克制" "https://www.youtube.com/watch?v=CEqwRGpHINc" "00:02:54" "00:03:50" || failures=$((failures + 1))
download_clip "Top4-超越无限" "https://www.youtube.com/watch?v=1CFQ1t5WqeY" "00:03:12" "00:04:08" || failures=$((failures + 1))
download_clip "Top3-不为谁而作的歌" "https://www.youtube.com/watch?v=gd38-X3HpbM" "00:03:32" "00:04:36" || failures=$((failures + 1))
download_clip "Top2-学不会" "https://www.youtube.com/watch?v=27R6ZavdzzQ" "00:03:03" "00:04:02" || failures=$((failures + 1))
download_clip "Top1-无拘" "https://www.youtube.com/watch?v=NeRSqC1xuDI" "00:03:19" "00:04:30" || failures=$((failures + 1))

if [[ "$failures" -gt 0 ]]; then
  printf "\nCompleted with %s failure(s).\n" "$failures" >&2
  exit 1
fi

printf "\nAll clips downloaded.\n"
