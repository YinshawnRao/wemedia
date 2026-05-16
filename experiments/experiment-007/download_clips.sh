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
  "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-007" "$start" "$end"
}

failures=0

download_clip "寓言" "https://www.youtube.com/watch?v=-4eJy_cpvoo" "00:00:48" "00:01:33" || failures=$((failures + 1))
download_clip "欧若拉" "https://www.youtube.com/watch?v=dmwJaG-R1iM" "00:00:52" "00:01:37" || failures=$((failures + 1))
download_clip "隐形的翅膀" "https://www.youtube.com/watch?v=be2wvNFTLMc" "00:00:54" "00:01:39" || failures=$((failures + 1))
download_clip "梦里花" "https://www.youtube.com/watch?v=JMQOlI5-dRU" "00:01:02" "00:01:47" || failures=$((failures + 1))
download_clip "看得最远的地方" "https://www.youtube.com/watch?v=RdRsVog0y2w" "00:01:03" "00:01:48" || failures=$((failures + 1))
download_clip "淋雨一直走" "https://www.youtube.com/watch?v=WTcodZDH-Oc" "00:00:48" "00:01:33" || failures=$((failures + 1))
download_clip "亲爱的那不是爱情" "https://www.youtube.com/watch?v=HwF1i_6Iwp8" "00:01:03" "00:01:48" || failures=$((failures + 1))
download_clip "遗失的美好" "https://www.youtube.com/watch?v=sh4BwEDtRI0" "00:01:08" "00:01:53" || failures=$((failures + 1))
download_clip "不想懂得" "https://www.youtube.com/watch?v=YaJWn-Spxfc" "00:01:08" "00:01:53" || failures=$((failures + 1))
download_clip "手心的太阳" "https://www.youtube.com/watch?v=LbDVqYaQboY" "00:01:08" "00:01:53" || failures=$((failures + 1))

if [[ "$failures" -gt 0 ]]; then
  printf "\nCompleted with %s failure(s).\n" "$failures" >&2
  exit 1
fi

printf "\nAll clips downloaded.\n"
