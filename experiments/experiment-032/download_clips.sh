#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
OUT_DIR="$ROOT_DIR/sandbox/yt-dlp/clips/experiment-032"
ARCHIVE="$ROOT_DIR/sandbox/yt-dlp/archive/experiment-032.txt"
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

download_clip "top5" "unconditionally-for-you" "https://www.youtube.com/watch?v=XPD-0b66Wv4" "00:02:58-00:03:32"
download_clip "top4" "love-song" "https://www.youtube.com/watch?v=itjyryJ-8IU" "00:02:52-00:03:26"
download_clip "top3" "worship" "https://www.youtube.com/watch?v=TUXD13PSebw" "00:02:48-00:03:22"
download_clip "top2" "silkroad" "https://www.youtube.com/watch?v=LwaZVMERWdQ" "00:03:26-00:04:00"
download_clip "top1" "wings-of-love" "https://www.youtube.com/watch?v=KAn2ejVJlE0" "00:03:24-00:03:58"
