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
  if ! "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-030" "$start" "$end"; then
    printf "Download failed: %s\n" "$label" >&2
    failures=$((failures + 1))
  fi
}

download_clip "Top5 新房客" "https://www.youtube.com/watch?v=MUC6DZTZL4k" "00:03:20" "00:03:54"
download_clip "Top4 百年孤寂" "https://www.youtube.com/watch?v=upkaTcir1m8" "00:02:44" "00:03:18"
download_clip "Top3 开到荼蘼" "https://www.youtube.com/watch?v=8rnnsxbKBNw" "00:03:05" "00:03:39"
download_clip "Top2 浮躁" "https://www.youtube.com/watch?v=pTy91LJGV7A" "00:01:05" "00:01:39"
download_clip "Top1 半途而废" "https://www.youtube.com/watch?v=TxJIi_NOR54" "00:01:23" "00:01:57"

if [[ "$failures" -gt 0 ]]; then
  printf "\n%s clip download(s) failed.\n" "$failures" >&2
  exit 1
fi

printf "\nAll experiment-030 clips downloaded.\n"

