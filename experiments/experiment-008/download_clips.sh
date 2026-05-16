#!/usr/bin/env bash
set -uo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
export WEMEDIA_OUTPUT_MODE=test

download_clip() {
  local title="$1"
  local url="$2"
  local start="$3"
  local end="$4"

  printf "\n[%s] %s -> %s\n" "$title" "$start" "$end"
  "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-008" "$start" "$end"
}

failures=0

download_clip "阿刁" "https://www.youtube.com/watch?v=Oq3dVBEdc4M" "00:03:55" "00:04:35" || failures=$((failures + 1))
download_clip "不痛" "https://www.youtube.com/watch?v=zXHqzoroAj4" "00:02:54" "00:03:34" || failures=$((failures + 1))
download_clip "呐喊" "https://www.youtube.com/watch?v=UU4p0eb0IBQ" "00:02:55" "00:03:35" || failures=$((failures + 1))
download_clip "寓言" "https://www.youtube.com/watch?v=-4eJy_cpvoo" "00:02:46" "00:03:26" || failures=$((failures + 1))
download_clip "欧若拉" "https://www.youtube.com/watch?v=dmwJaG-R1iM" "00:02:45" "00:03:25" || failures=$((failures + 1))

if [[ "$failures" -gt 0 ]]; then
  printf "\nCompleted with %s failure(s).\n" "$failures" >&2
  exit 1
fi

printf "\nAll clips downloaded.\n"
