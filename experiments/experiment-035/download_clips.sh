#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
OUT_DIR="$ROOT_DIR/sandbox/yt-dlp/clips/experiment-035"
ARCHIVE="$ROOT_DIR/sandbox/yt-dlp/archive/experiment-035.txt"
YTDLP_FORMAT="${YTDLP_FORMAT:-bv*[height<=1080]+ba/b[height<=1080]/b}"

mkdir -p "$OUT_DIR" "$(dirname "$ARCHIVE")"

download_clip() {
  local rank="$1"
  local song_slug="$2"
  local url="$3"
  local section="$4"

  yt-dlp \
    --cookies-from-browser chrome \
    --js-runtimes node \
    --download-archive "$ARCHIVE" \
    --download-sections "*$section" \
    --force-keyframes-at-cuts \
    --no-write-subs \
    --no-write-auto-subs \
    --write-info-json \
    --write-description \
    --write-thumbnail \
    -f "$YTDLP_FORMAT" \
    --merge-output-format mp4 \
    -o "$OUT_DIR/${rank}_${song_slug}_%(upload_date)s_%(uploader).40B_%(title).80B_%(id)s_clip_${section//:/-}.%(ext)s" \
    "$url"
}

download_clip "top5" "agent-j" "https://www.youtube.com/watch?v=gG6q90HXSkw" "00:02:14-00:02:48"
download_clip "top4" "dao-dai" "https://www.youtube.com/watch?v=rOjdS33Wk5E" "00:03:16-00:03:50"
download_clip "top3" "ugly-beauty" "https://www.youtube.com/watch?v=-wIHmPAvMBo" "00:02:34-00:03:08"
download_clip "top2" "play" "https://www.youtube.com/watch?v=c86t8hoVw8E" "00:01:44-00:02:18"
download_clip "top1" "dancing-diva" "https://www.youtube.com/watch?v=0EN3MnGEBXk" "00:02:28-00:03:02"

