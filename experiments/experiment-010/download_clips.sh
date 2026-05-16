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
  "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-010" "$start" "$end"
}

failures=0

download_clip "三天三夜" "https://www.youtube.com/watch?v=NFHb0OwmE-0" "00:03:13" "00:03:53" || failures=$((failures + 1))
download_clip "掉了" "https://www.youtube.com/watch?v=1dyRJJzlwQ8" "00:02:43" "00:03:23" || failures=$((failures + 1))
download_clip "听海" "https://www.youtube.com/watch?v=mLk61pfiHQ0" "00:03:48" "00:04:28" || failures=$((failures + 1))
download_clip "剪爱" "https://www.youtube.com/watch?v=ZH9k3643BH8" "00:03:12" "00:03:52" || failures=$((failures + 1))
download_clip "也许明天" "https://www.youtube.com/watch?v=YloYq5cZRig" "00:03:21" "00:04:01" || failures=$((failures + 1))

if [[ "$failures" -gt 0 ]]; then
  printf "\nCompleted with %s failure(s).\n" "$failures" >&2
  exit 1
fi

printf "\nAll clips downloaded.\n"
