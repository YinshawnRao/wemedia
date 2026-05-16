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
  "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-012" "$start" "$end"
}

failures=0

download_clip "Top5-失忆" "https://www.youtube.com/watch?v=9_nxUIB4zqo" "00:03:55" "00:04:38" || failures=$((failures + 1))
download_clip "Top4-幻想爱" "https://www.youtube.com/watch?v=gVbVBCh6xlA" "00:02:42" "00:03:25" || failures=$((failures + 1))
download_clip "Top3-城市之窗" "https://www.youtube.com/watch?v=iaCu-D-2vxQ" "00:03:09" "00:03:55" || failures=$((failures + 1))
download_clip "Top2-绝不" "https://www.youtube.com/watch?v=1ETckF6OUok" "00:02:54" "00:03:34" || failures=$((failures + 1))
download_clip "Top1-伤日快乐" "https://www.youtube.com/watch?v=ORJc4ZNCPks" "00:03:28" "00:04:08" || failures=$((failures + 1))

if [[ "$failures" -gt 0 ]]; then
  printf "\nCompleted with %s failure(s).\n" "$failures" >&2
  exit 1
fi

printf "\nAll clips downloaded.\n"
