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
  if ! "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-029" "$start" "$end"; then
    printf "Download failed: %s\n" "$label" >&2
    failures=$((failures + 1))
  fi
}

download_clip "Top5 反高潮" "https://www.youtube.com/watch?v=miCknzVh9MY" "00:02:45" "00:03:19"
download_clip "Top4 黑夜不再来" "https://www.youtube.com/watch?v=ncG579yBflc" "00:03:17" "00:03:51"
download_clip "Top3 一丝不挂" "https://www.youtube.com/watch?v=s2LzcNvAPF0" "00:02:44" "00:03:18"
download_clip "Top2 时代巨轮" "https://www.youtube.com/watch?v=7H2FPD7Z3rE" "00:02:10" "00:02:44"
download_clip "Top1 浮夸" "https://www.youtube.com/watch?v=KgQx3Ob8l8A" "00:03:27" "00:04:01"

if [[ "$failures" -gt 0 ]]; then
  printf "\n%s clip download(s) failed.\n" "$failures" >&2
  exit 1
fi

printf "\nAll experiment-029 clips downloaded.\n"

