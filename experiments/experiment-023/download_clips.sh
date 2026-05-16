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
  if ! "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-023" "$start" "$end"; then
    printf "Download failed: %s\n" "$label" >&2
    failures=$((failures + 1))
  fi
}

download_clip "Top5 花香" "https://www.youtube.com/watch?v=4P64Mb9UX74" "00:03:24" "00:04:10"
download_clip "Top4 我难过" "https://www.youtube.com/watch?v=2l4X4lGP_Zk" "00:03:32" "00:04:13"
download_clip "Top3 记事本" "https://www.youtube.com/watch?v=wuC41ukQyrI" "00:03:00" "00:03:48"
download_clip "Top2 出卖" "https://www.youtube.com/watch?v=6RT_Fpy1__s" "00:02:20" "00:03:28"
download_clip "Top1 有没有一首歌会让你想起我" "https://www.youtube.com/watch?v=p9lNpWa4OXU" "00:03:03" "00:04:28"

if [[ "$failures" -gt 0 ]]; then
  printf "\n%s clip download(s) failed.\n" "$failures" >&2
  exit 1
fi

printf "\nAll experiment-023 clips downloaded.\n"

