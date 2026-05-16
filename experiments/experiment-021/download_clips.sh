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
  "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-021" "$start" "$end"
}

failures=0

download_clip "Top5-不爱请闪开" "https://www.youtube.com/watch?v=utYC304g1FQ" "00:02:10" "00:03:18" || failures=$((failures + 1))
download_clip "Top4-类似爱情" "https://www.youtube.com/watch?v=nlejjTDgHBg" "00:03:06" "00:04:20" || failures=$((failures + 1))
download_clip "Top3-遗失的心跳" "https://www.youtube.com/watch?v=ecjV2Xqc_dI" "00:03:00" "00:04:18" || failures=$((failures + 1))
download_clip "Top2-表白" "https://www.youtube.com/watch?v=_qvb302xHCA" "00:02:04" "00:03:12" || failures=$((failures + 1))
download_clip "Top1-最熟悉的陌生人" "https://www.youtube.com/watch?v=C5mI0TqrJ-4" "00:02:40" "00:03:58" || failures=$((failures + 1))

if [[ "$failures" -gt 0 ]]; then
  printf "\nCompleted with %s failure(s).\n" "$failures" >&2
  exit 1
fi

printf "\nAll clips downloaded.\n"

