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
  "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-014" "$start" "$end"
}

failures=0

download_clip "Top5-脚本" "https://www.youtube.com/watch?v=e-_fnnaQXnk" "00:02:29" "00:03:22" || failures=$((failures + 1))
download_clip "Top4-天地龙鳞" "https://www.youtube.com/watch?v=k3mOnzOG4kU" "00:02:15" "00:03:12" || failures=$((failures + 1))
download_clip "Top3-爱错" "https://www.youtube.com/watch?v=JdpNT5yRbwg" "00:02:43" "00:03:38" || failures=$((failures + 1))
download_clip "Top2-就是现在" "https://www.youtube.com/watch?v=7DS631wSYDM" "00:03:32" "00:04:24" || failures=$((failures + 1))
download_clip "Top1-缘分一道桥" "https://www.youtube.com/watch?v=EQ5Ib7jNnnE" "00:02:44" "00:04:08" || failures=$((failures + 1))

if [[ "$failures" -gt 0 ]]; then
  printf "\nCompleted with %s failure(s).\n" "$failures" >&2
  exit 1
fi

printf "\nAll clips downloaded.\n"
