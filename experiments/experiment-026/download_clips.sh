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
  if ! "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-026" "$start" "$end"; then
    printf "Download failed: %s\n" "$label" >&2
    failures=$((failures + 1))
  fi
}

download_clip "Top5 Honey Honey Honey" "https://www.youtube.com/watch?v=J5YpdUtcPgI" "00:01:10" "00:01:42"
download_clip "Top4 说爱你" "https://www.youtube.com/watch?v=cOBQgUZnceg" "00:00:44" "00:01:16"
download_clip "Top3 当你" "https://www.youtube.com/watch?v=Es2b6sM2nrs" "00:00:48" "00:01:20"
download_clip "Top2 我会好好的" "https://www.youtube.com/watch?v=Gw4Q7-NBFWs" "00:01:25" "00:01:57"
download_clip "Top1 睫毛弯弯" "https://www.youtube.com/watch?v=FzKO6WZN5b4" "00:00:49" "00:01:21"

if [[ "$failures" -gt 0 ]]; then
  printf "\n%s clip download(s) failed.\n" "$failures" >&2
  exit 1
fi

printf "\nAll experiment-026 clips downloaded.\n"
