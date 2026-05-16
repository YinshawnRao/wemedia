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
  "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-013" "$start" "$end"
}

failures=0

download_clip "Top5-望春风" "https://www.youtube.com/watch?v=vqgR5lOeKnY" "00:02:02" "00:02:52" || failures=$((failures + 1))
download_clip "Top4-心乱飞" "https://www.youtube.com/watch?v=bkiNoPR1qls" "00:02:31" "00:03:35" || failures=$((failures + 1))
download_clip "Top3-飞机场的10:30" "https://www.youtube.com/watch?v=GurozK-HRTw" "00:03:32" "00:04:24" || failures=$((failures + 1))
download_clip "Top2-爱是个什么东西" "https://www.youtube.com/watch?v=UotQ0khBcz8" "00:03:12" "00:04:08" || failures=$((failures + 1))
download_clip "Top1-不爱" "https://www.youtube.com/watch?v=dLRaz_y4Vu4" "00:02:36" "00:03:18" || failures=$((failures + 1))

if [[ "$failures" -gt 0 ]]; then
  printf "\nCompleted with %s failure(s).\n" "$failures" >&2
  exit 1
fi

printf "\nAll clips downloaded.\n"
