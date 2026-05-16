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
  if ! "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-025" "$start" "$end"; then
    printf "Download failed: %s\n" "$label" >&2
    failures=$((failures + 1))
  fi
}

download_clip "Top5 天亮以后" "https://www.youtube.com/watch?v=nPtEgaLXPHs" "00:02:49" "00:03:58"
download_clip "Top4 夏雪" "https://www.youtube.com/watch?v=9Qm8TYJynlc" "00:02:55" "00:03:55"
download_clip "Top3 我有我的Young" "https://www.youtube.com/watch?v=Gf0gsx_qbj8" "00:03:13" "00:04:12"
download_clip "Top2 不作你的朋友" "https://www.youtube.com/watch?v=YbF-neBEUrc" "00:03:13" "00:04:18"
download_clip "Top1 非你莫属" "https://www.youtube.com/watch?v=jRFpeNY1k-Q" "00:03:10" "00:04:20"

if [[ "$failures" -gt 0 ]]; then
  printf "\n%s clip download(s) failed.\n" "$failures" >&2
  exit 1
fi

printf "\nAll experiment-025 clips downloaded.\n"
