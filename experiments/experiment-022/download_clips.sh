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
  if ! "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-022" "$start" "$end"; then
    printf "Download failed: %s\n" "$label" >&2
    failures=$((failures + 1))
  fi
}

download_clip "Top5 我都知道" "https://www.youtube.com/watch?v=fsuzivOrCEw" "00:03:00" "00:03:38"
download_clip "Top4 好心情 Just Be Yourself" "https://www.youtube.com/watch?v=1yFZndeZ5pA" "00:01:58" "00:02:40"
download_clip "Top3 手牵手" "https://www.youtube.com/watch?v=nS80nuP_wMQ" "00:03:42" "00:04:52"
download_clip "Top2 爱什么稀罕" "https://www.youtube.com/watch?v=N9PcP8v_ohY" "00:02:36" "00:03:22"
download_clip "Top1 算你狠" "https://www.youtube.com/watch?v=xlLM6W7iRUI" "00:00:39" "00:01:35"

if [[ "$failures" -gt 0 ]]; then
  printf "\n%s clip download(s) failed.\n" "$failures" >&2
  exit 1
fi

printf "\nAll experiment-022 clips downloaded.\n"

