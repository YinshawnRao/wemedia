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
  "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-011" "$start" "$end"
}

failures=0

download_clip "周杰伦-搁浅" "https://www.youtube.com/watch?v=YJfHuATJYsQ" "00:02:55" "00:03:35" || failures=$((failures + 1))
download_clip "王力宏-你不在" "https://www.youtube.com/watch?v=_OP1roi1_Fs" "00:03:03" "00:03:43" || failures=$((failures + 1))
download_clip "陶喆-黑色柳丁" "https://www.youtube.com/watch?v=VC4KT__tx5g" "00:02:45" "00:03:25" || failures=$((failures + 1))
download_clip "林俊杰-不为谁而作的歌" "https://www.youtube.com/watch?v=gd38-X3HpbM" "00:03:43" "00:04:23" || failures=$((failures + 1))

if [[ "$failures" -gt 0 ]]; then
  printf "\nCompleted with %s failure(s).\n" "$failures" >&2
  exit 1
fi

printf "\nAll clips downloaded.\n"
