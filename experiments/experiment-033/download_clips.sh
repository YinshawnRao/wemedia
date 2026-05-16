#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
OUT_DIR="$ROOT_DIR/sandbox/yt-dlp/clips/experiment-033"
ARCHIVE="$ROOT_DIR/sandbox/yt-dlp/archive/experiment-033.txt"
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
    -o "$OUT_DIR/%(upload_date)s_%(uploader).40B_%(title).80B_%(id)s_clip_${section//:/-}.%(ext)s" \
    "$url"
}

download_clip "top5" "bu-jian-bu-san" "https://www.youtube.com/watch?v=k9x4Ax-fz4A" "00:02:42-00:03:16"
download_clip "top4" "feng-wang-bei-chui" "https://www.youtube.com/watch?v=4T-HSAZMPXg" "00:03:16-00:03:50"
download_clip "top3" "ni-kuai-hui-lai" "https://www.youtube.com/watch?v=SkwKiJPtJxk" "00:02:45-00:03:19"
download_clip "top2" "ran-shao" "https://www.youtube.com/watch?v=iZjVegLNEA0" "00:03:18-00:03:52"
download_clip "top1" "zheng-jiu" "https://www.youtube.com/watch?v=GfviQRY-UU0" "00:04:10-00:04:44"
