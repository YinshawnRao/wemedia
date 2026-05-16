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
  if ! "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-027" "$start" "$end"; then
    printf "Download failed: %s\n" "$label" >&2
    failures=$((failures + 1))
  fi
}

download_clip "Top5 声生不息群星大合唱版" "https://www.youtube.com/watch?v=denQIeRAhmo" "00:03:35" "00:04:07"
download_clip "Top4 信苏见信版" "https://www.youtube.com/watch?v=_iJqSr2arZ0" "00:00:42" "00:01:14"
download_clip "Top3 邓紫棋版" "https://www.youtube.com/watch?v=OfIFA-V6Zec" "00:02:55" "00:03:27"
download_clip "Top2 林忆莲版" "https://www.youtube.com/watch?v=YXTf5wVacfg" "00:02:12" "00:02:44"
download_clip "Top1 林子祥版" "https://www.youtube.com/watch?v=n5wgWGy_qUA" "00:03:32" "00:04:04"

if [[ "$failures" -gt 0 ]]; then
  printf "\n%s clip download(s) failed.\n" "$failures" >&2
  exit 1
fi

printf "\nAll experiment-027 clips downloaded.\n"
