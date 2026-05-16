#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
OUT_DIR="$ROOT_DIR/videos"
mkdir -p "$OUT_DIR"

if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "ffmpeg not found; skip demo videos." >&2
  exit 0
fi

find "$ROOT_DIR/outputs" -type f \( -name '*.wav' -o -name '*.mp3' \) | sort | while read -r audio; do
  rel="${audio#$ROOT_DIR/outputs/}"
  scheme="${rel%%/*}"
  base="$(basename "$audio")"
  sample="${base%.*}"
  out="$OUT_DIR/demo_${scheme}_${sample}.mp4"
  label="${scheme} ${sample}"
  if ffmpeg -y -f lavfi -i "color=c=0x0E1116:s=1280x720:d=20" -i "$audio" -shortest -vf "drawtext=text='$label':fontcolor=0xF8FAFC:fontsize=44:x=(w-text_w)/2:y=(h-text_h)/2" -c:v libx264 -pix_fmt yuv420p -c:a aac "$out" >/dev/null 2>&1; then
    echo "$out"
  else
    ffmpeg -y -f lavfi -i "color=c=0x0E1116:s=1280x720:d=20" -i "$audio" -shortest -c:v libx264 -pix_fmt yuv420p -c:a aac "$out" >/dev/null 2>&1 || true
    echo "$out"
  fi
done
