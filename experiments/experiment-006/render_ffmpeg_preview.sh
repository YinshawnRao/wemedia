#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
PROJECT_DIR="${ROOT_DIR}/sandbox/hyperframes/experiment-006"
ASSET_DIR="${PROJECT_DIR}/assets"
OUT_DIR="${ROOT_DIR}/sandbox/exports/experiment-006"
WORK_DIR="${OUT_DIR}/ffmpeg_preview_work"
FINAL_OUT="${OUT_DIR}/angela-zhang-special-preview.mp4"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

mkdir -p "${WORK_DIR}/overlays" "${WORK_DIR}/segments" "${OUT_DIR}"

render_svg_png() {
  local file="$1"
  "$CHROME" \
    --headless=new \
    --disable-gpu \
    --hide-scrollbars \
    --default-background-color=00000000 \
    --screenshot="${WORK_DIR}/overlays/${file}.png" \
    --window-size=1080,1920 \
    "file://${WORK_DIR}/overlays/${file}.svg" >/dev/null
}

svg_escape() {
  local value="$1"
  value="${value//&/&amp;}"
  value="${value//</&lt;}"
  value="${value//>/&gt;}"
  printf "%s" "$value"
}

make_segment_overlay() {
  local file="$1"
  local accent="$2"
  local number="$3"
  local song="$4"
  local tag="$5"
  local note="$6"
  local source="$7"

  number="$(svg_escape "$number")"
  song="$(svg_escape "$song")"
  tag="$(svg_escape "$tag")"
  note="$(svg_escape "$note")"
  source="$(svg_escape "$source")"

  cat > "${WORK_DIR}/overlays/${file}.svg" <<SVG
<svg xmlns="http://www.w3.org/2000/svg" width="1080" height="1920" viewBox="0 0 1080 1920">
  <defs>
    <style>
      text { font-family: "STHeiti", "Hiragino Sans GB", "Heiti SC", sans-serif; letter-spacing: 0; }
      .small { font-size: 32px; font-weight: 800; }
      .song { font-size: 66px; font-weight: 900; }
      .tag { font-size: 36px; font-weight: 800; }
      .note { font-size: 29px; font-weight: 650; }
      .source { font-size: 22px; font-weight: 650; }
    </style>
  </defs>
  <rect x="54" y="82" width="442" height="70" fill="#0e1116" opacity="0.74"/>
  <text x="78" y="127" class="small" fill="${accent}">${number}</text>
  <rect x="54" y="1352" width="972" height="292" fill="#0e1116" opacity="0.78"/>
  <rect x="54" y="1352" width="8" height="292" fill="${accent}"/>
  <text x="88" y="1446" class="song" fill="#f8fafc">${song}</text>
  <text x="88" y="1526" class="tag" fill="#f7f2e8">${tag}</text>
  <text x="88" y="1586" class="note" fill="#f7f2e8">${note}</text>
  <rect x="54" y="1772" width="972" height="64" fill="#0e1116" opacity="0.68"/>
  <rect x="78" y="1801" width="118" height="5" fill="${accent}"/>
  <text x="218" y="1814" class="source" fill="#f7f2e8">${source}</text>
</svg>
SVG
  render_svg_png "$file"
}

make_title_overlay() {
  local file="$1"
  local eyebrow="$2"
  local title_a="$3"
  local title_b="$4"
  local subtitle="$5"

  eyebrow="$(svg_escape "$eyebrow")"
  title_a="$(svg_escape "$title_a")"
  title_b="$(svg_escape "$title_b")"
  subtitle="$(svg_escape "$subtitle")"

  cat > "${WORK_DIR}/overlays/${file}.svg" <<SVG
<svg xmlns="http://www.w3.org/2000/svg" width="1080" height="1920" viewBox="0 0 1080 1920">
  <defs>
    <style>
      text { font-family: "STHeiti", "Hiragino Sans GB", "Heiti SC", sans-serif; letter-spacing: 0; }
      .eyebrow { font-size: 34px; font-weight: 800; }
      .title { font-size: 92px; font-weight: 900; }
      .subtitle { font-size: 36px; font-weight: 700; }
    </style>
  </defs>
  <rect width="1080" height="1920" fill="#0e1116"/>
  <rect x="0" y="0" width="1080" height="24" fill="#e94b35"/>
  <rect x="0" y="24" width="1080" height="16" fill="#2bb3a3"/>
  <rect x="72" y="596" width="12" height="390" fill="#f2c14e"/>
  <text x="72" y="222" class="eyebrow" fill="#2bb3a3">${eyebrow}</text>
  <text x="112" y="760" class="title" fill="#f8fafc">${title_a}</text>
  <text x="112" y="880" class="title" fill="#f2c14e">${title_b}</text>
  <text x="72" y="1668" class="subtitle" fill="#f7f2e8">${subtitle}</text>
</svg>
SVG
  render_svg_png "$file"
}

render_overlay_segment() {
  local input="$1"
  local overlay="$2"
  local output="$3"

  ffmpeg -v error -y -i "$input" -i "${WORK_DIR}/overlays/${overlay}.png" \
    -filter_complex "[0:v][1:v]overlay=0:0:format=auto,format=yuv420p[v]" \
    -map "[v]" -map 0:a? \
    -r 30 -c:v libx264 -preset veryfast -crf 22 -g 60 -keyint_min 60 -sc_threshold 0 \
    -c:a copy -movflags +faststart "$output"
}

render_title_segment() {
  local overlay="$1"
  local duration="$2"
  local output="$3"

  ffmpeg -v error -y -loop 1 -t "$duration" -i "${WORK_DIR}/overlays/${overlay}.png" \
    -f lavfi -t "$duration" -i "anullsrc=channel_layout=stereo:sample_rate=48000" \
    -map 0:v -map 1:a \
    -r 30 -c:v libx264 -preset veryfast -crf 22 -g 60 -keyint_min 60 -sc_threshold 0 -pix_fmt yuv420p \
    -c:a aac -b:a 160k -ar 48000 -ac 2 -shortest -movflags +faststart "$output"
}

make_title_overlay "00-intro" "ANGELA ZHANG / SINGLE ARTIST TEST" "张韶涵专题" "清亮、穿透、一直往前" "本地实验样片：五首歌切成五个章节，保留原始音乐音频。"
render_title_segment "00-intro" "4.0" "${WORK_DIR}/segments/00-intro.mp4"

make_segment_overlay "01-aurora" "#e94b35" "01 / 早期辨识度" "欧若拉" "一开口就有自己的光" "清亮声线先抓住耳朵，旋律再把记忆点放大。" "福茂唱片 / 欧若拉 Official Music Video"
render_overlay_segment "${ASSET_DIR}/01-aurora.mp4" "01-aurora" "${WORK_DIR}/segments/01-aurora.mp4"

make_segment_overlay "02-wings" "#2bb3a3" "02 / 穿透型高音" "隐形的翅膀" "清亮，但有力量" "不是靠厚度压人，而是把声音直接送到副歌中心。" "福茂唱片 / 隐形的翅膀 Official Music Video"
render_overlay_segment "${ASSET_DIR}/02-wings.mp4" "02-wings" "${WORK_DIR}/segments/02-wings.mp4"

make_segment_overlay "03-not-love" "#f2c14e" "03 / 情歌叙事" "亲爱的那不是爱情" "把遗憾唱得很克制" "这类歌的重点不是炫技，而是句尾那一点没说完。" "福茂唱片 / 亲爱的那不是爱情 Official Music Video"
render_overlay_segment "${ASSET_DIR}/03-not-love.mp4" "03-not-love" "${WORK_DIR}/segments/03-not-love.mp4"

make_segment_overlay "04-lost-beauty" "#f7f2e8" "04 / 遗憾感" "遗失的美好" "柔软里的疼痛感" "越不急着爆发，越能把错过两个字唱实。" "福茂唱片 / 遗失的美好 Official Music Video"
render_overlay_segment "${ASSET_DIR}/04-lost-beauty.mp4" "04-lost-beauty" "${WORK_DIR}/segments/04-lost-beauty.mp4"

make_segment_overlay "05-keep-walking" "#9ccfd8" "05 / 后期能量" "淋雨一直走" "一直往前的张韶涵" "从清亮走到坚定，专题的弧线就成立了。" "張韶涵Angela Zhang / 淋雨一直走 Official HD MV"
render_overlay_segment "${ASSET_DIR}/05-keep-walking.mp4" "05-keep-walking" "${WORK_DIR}/segments/05-keep-walking.mp4"

make_title_overlay "99-closing" "NEXT ANGELA TEST?" "单歌手专题" "可以继续细分" "下一版可以试试：现场高音版 / 励志金曲版 / 情歌叙事版。"
render_title_segment "99-closing" "5.0" "${WORK_DIR}/segments/99-closing.mp4"

cat > "${WORK_DIR}/concat.txt" <<LIST
file '${WORK_DIR}/segments/00-intro.mp4'
file '${WORK_DIR}/segments/01-aurora.mp4'
file '${WORK_DIR}/segments/02-wings.mp4'
file '${WORK_DIR}/segments/03-not-love.mp4'
file '${WORK_DIR}/segments/04-lost-beauty.mp4'
file '${WORK_DIR}/segments/05-keep-walking.mp4'
file '${WORK_DIR}/segments/99-closing.mp4'
LIST

ffmpeg -v error -y -f concat -safe 0 -i "${WORK_DIR}/concat.txt" -c copy -movflags +faststart "$FINAL_OUT"

printf "%s\n" "$FINAL_OUT"
