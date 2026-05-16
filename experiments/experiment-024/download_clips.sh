#!/usr/bin/env bash
set -uo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
export WEMEDIA_OUTPUT_MODE=test
export YTDLP_FORMAT="${YTDLP_FORMAT:-bv*[height<=1080]+ba/b[height<=1080]/b}"

failures=0

download_clip() {
  local label="$1"
  local url="$2"
  local start="$3"
  local end="$4"

  printf "\n==> %s %s-%s\n" "$label" "$start" "$end"
  if ! "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-024" "$start" "$end"; then
    printf "Download failed: %s\n" "$label" >&2
    failures=$((failures + 1))
  fi
}

download_clip "Top5 爱笑的眼睛" "https://www.youtube.com/watch?v=oDoRF0vohvE" "00:03:00" "00:03:42"
download_clip "Top4 一眼万年" "https://www.youtube.com/watch?v=IhUGIZjOwWs" "00:02:55" "00:04:05"
download_clip "Top3 心墙" "https://www.youtube.com/watch?v=VhCRokYVF1I" "00:02:40" "00:03:36"
download_clip "Top2 当你" "https://www.youtube.com/watch?v=Es2b6sM2nrs" "00:02:46" "00:03:30"
download_clip "Top1 记得" "https://www.youtube.com/watch?v=qm3wIQWnXxg" "00:03:05" "00:04:25"

if [[ "$failures" -gt 0 ]]; then
  printf "\n%s clip download(s) failed.\n" "$failures" >&2
  exit 1
fi

printf "\nAll experiment-024 clips downloaded.\n"

