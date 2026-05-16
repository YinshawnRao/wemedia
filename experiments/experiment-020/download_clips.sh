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
  "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-020" "$start" "$end"
}

failures=0

download_clip "Top5-引路的风筝" "https://www.youtube.com/watch?v=4FsAGbLe_LU" "00:03:16" "00:04:28" || failures=$((failures + 1))
download_clip "Top4-无度" "https://www.youtube.com/watch?v=5yR3L5_zI1w" "00:03:24" "00:04:40" || failures=$((failures + 1))
download_clip "Top3-全面沦陷" "https://www.youtube.com/watch?v=BdWUZmEVRmU" "00:02:18" "00:03:16" || failures=$((failures + 1))
download_clip "Top2-破茧" "https://www.youtube.com/watch?v=e1_4y8RJ5xU" "00:02:18" "00:03:24" || failures=$((failures + 1))
download_clip "Top1-阿刁" "https://www.youtube.com/watch?v=Oq3dVBEdc4M" "00:03:35" "00:04:48" || failures=$((failures + 1))

if [[ "$failures" -gt 0 ]]; then
  printf "\nCompleted with %s failure(s).\n" "$failures" >&2
  exit 1
fi

printf "\nAll clips downloaded.\n"

