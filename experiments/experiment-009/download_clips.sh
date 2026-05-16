#!/usr/bin/env bash
set -uo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
export WEMEDIA_OUTPUT_MODE=test

download_clip() {
  local title="$1"
  local url="$2"
  local start="$3"
  local end="$4"

  printf "\n[%s] %s -> %s\n" "$title" "$start" "$end"
  "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-009" "$start" "$end"
}

failures=0

download_clip "年轮说" "https://www.youtube.com/watch?v=anurOHpo0aY" "00:03:04" "00:03:44" || failures=$((failures + 1))
download_clip "带我走" "https://www.youtube.com/watch?v=KOLDiXnQC7Q" "00:03:28" "00:04:08" || failures=$((failures + 1))
download_clip "雨爱" "https://www.youtube.com/watch?v=oec9R5ypf-o" "00:03:18" "00:03:58" || failures=$((failures + 1))
download_clip "匿名的好友" "https://www.youtube.com/watch?v=s9hGDIpwfXw" "00:02:54" "00:03:34" || failures=$((failures + 1))
download_clip "暧昧" "https://www.youtube.com/watch?v=mebzXfWi87E" "00:03:15" "00:03:55" || failures=$((failures + 1))

if [[ "$failures" -gt 0 ]]; then
  printf "\nCompleted with %s failure(s).\n" "$failures" >&2
  exit 1
fi

printf "\nAll clips downloaded.\n"
