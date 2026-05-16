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
  if ! "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-028" "$start" "$end"; then
    printf "Download failed: %s\n" "$label" >&2
    failures=$((failures + 1))
  fi
}

download_clip "Top5 李玟 Di Da Di 救场" "https://www.youtube.com/watch?v=ThR4kOGHYpI" "00:00:03" "00:00:35"
download_clip "Top4 戴佩妮 怎样 递麦男粉" "https://www.youtube.com/watch?v=HW35TnjoFZk" "00:00:04" "00:00:36"
download_clip "Top3 王菲陈奕迅 因为爱情 春晚" "https://www.youtube.com/watch?v=HDudXh-FcVg" "00:01:02" "00:01:34"
download_clip "Top2 萨顶顶 大名顶顶 话筒乌龙" "https://www.youtube.com/watch?v=Z5uhPP15gTk" "00:00:08" "00:00:40"
download_clip "Top1 飞轮海 我有我的YOUNG 真唱考古" "https://www.youtube.com/watch?v=f5x5wUapGHk" "00:00:14" "00:00:46"

if [[ "$failures" -gt 0 ]]; then
  printf "\n%s clip download(s) failed.\n" "$failures" >&2
  exit 1
fi

printf "\nAll experiment-028 clips downloaded.\n"
