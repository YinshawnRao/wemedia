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
  "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-019" "$start" "$end"
}

failures=0

download_clip "Top5-黑色幽默" "https://www.youtube.com/watch?v=wRT-5heURhY" "00:02:56" "00:04:08" || failures=$((failures + 1))
download_clip "Top4-一路向北" "https://www.youtube.com/watch?v=L229QDxDakU" "00:03:26" "00:04:36" || failures=$((failures + 1))
download_clip "Top3-枫" "https://www.youtube.com/watch?v=qzwsQTY-99o" "00:03:16" "00:04:26" || failures=$((failures + 1))
download_clip "Top2-搁浅" "https://www.youtube.com/watch?v=YJfHuATJYsQ" "00:02:52" "00:04:02" || failures=$((failures + 1))
download_clip "Top1-白色风车" "https://www.youtube.com/watch?v=K9CbHZLXPIA" "00:03:18" "00:04:34" || failures=$((failures + 1))

if [[ "$failures" -gt 0 ]]; then
  printf "\nCompleted with %s failure(s).\n" "$failures" >&2
  exit 1
fi

printf "\nAll clips downloaded.\n"

