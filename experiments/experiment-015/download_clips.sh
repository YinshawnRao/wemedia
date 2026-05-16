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
  "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-015" "$start" "$end"
}

failures=0

download_clip "01-庆祝" "https://www.youtube.com/watch?v=R3kR1uhYToY" "00:03:13" "00:03:49" || failures=$((failures + 1))
download_clip "02-甜心咒" "https://www.youtube.com/watch?v=pAR74thJz6o" "00:02:50" "00:03:35" || failures=$((failures + 1))
download_clip "03-可爱" "https://www.youtube.com/watch?v=RXnwOKeRANc" "00:02:57" "00:03:38" || failures=$((failures + 1))
download_clip "04-遇上爱" "https://www.youtube.com/watch?v=zfMKCK6JusE" "00:02:55" "00:03:44" || failures=$((failures + 1))
download_clip "05-只想爱你" "https://www.youtube.com/watch?v=hpkBwizROaE" "00:03:17" "00:04:12" || failures=$((failures + 1))

if [[ "$failures" -gt 0 ]]; then
  printf "\nCompleted with %s failure(s).\n" "$failures" >&2
  exit 1
fi

printf "\nAll clips downloaded.\n"
