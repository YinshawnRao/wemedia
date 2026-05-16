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
  "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-018" "$start" "$end"
}

failures=0

download_clip "Top5-爱上爱的味道" "https://www.youtube.com/watch?v=OfbmHsqDcMc" "00:02:20" "00:03:15" || failures=$((failures + 1))
download_clip "Top4-C大调" "https://www.youtube.com/watch?v=NFuKYLfCOxw" "00:02:23" "00:03:14" || failures=$((failures + 1))
download_clip "Top3-香水百合" "https://www.youtube.com/watch?v=8y0OGAA_NKo" "00:01:48" "00:02:45" || failures=$((failures + 1))
download_clip "Top2-头号甜心" "https://www.youtube.com/watch?v=8bUW7Pl3PjM" "00:02:30" "00:03:33" || failures=$((failures + 1))
download_clip "Top1-喜欢你没道理" "https://www.youtube.com/watch?v=rhuNm2X7nbA" "00:02:20" "00:03:16" || failures=$((failures + 1))

if [[ "$failures" -gt 0 ]]; then
  printf "\nCompleted with %s failure(s).\n" "$failures" >&2
  exit 1
fi

printf "\nAll clips downloaded.\n"
