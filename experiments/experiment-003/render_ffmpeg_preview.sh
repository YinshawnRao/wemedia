#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
PROJECT_DIR="${ROOT_DIR}/sandbox/hyperframes/experiment-003"
ASSET_DIR="${PROJECT_DIR}/assets"
OUT_DIR="${ROOT_DIR}/sandbox/exports/experiment-003"
WORK_DIR="${OUT_DIR}/ffmpeg_preview_work"
FINAL_OUT="${OUT_DIR}/chinese-female-singers-long-chorus-preview.mp4"
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
  local artist="$4"
  local tag="$5"
  local source="$6"

  number="$(svg_escape "$number")"
  artist="$(svg_escape "$artist")"
  tag="$(svg_escape "$tag")"
  source="$(svg_escape "$source")"

  cat > "${WORK_DIR}/overlays/${file}.svg" <<SVG
<svg xmlns="http://www.w3.org/2000/svg" width="1080" height="1920" viewBox="0 0 1080 1920">
  <defs>
    <style>
      text { font-family: "STHeiti", "Hiragino Sans GB", "Heiti SC", sans-serif; letter-spacing: 0; }
      .small { font-size: 32px; font-weight: 800; }
      .artist { font-size: 66px; font-weight: 900; }
      .tag { font-size: 34px; font-weight: 700; }
      .source { font-size: 22px; font-weight: 650; }
    </style>
  </defs>
  <rect x="54" y="82" width="420" height="70" fill="#0e1116" opacity="0.72"/>
  <text x="78" y="127" class="small" fill="${accent}">${number}</text>
  <rect x="54" y="1406" width="972" height="230" fill="#0e1116" opacity="0.76"/>
  <rect x="54" y="1406" width="8" height="230" fill="${accent}"/>
  <text x="88" y="1502" class="artist" fill="#f8fafc">${artist}</text>
  <text x="88" y="1578" class="tag" fill="#f7f2e8">${tag}</text>
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
    <radialGradient id="r1" cx="24%" cy="20%" r="38%"><stop offset="0" stop-color="#e94b35" stop-opacity="0.26"/><stop offset="1" stop-color="#0e1116" stop-opacity="0"/></radialGradient>
    <radialGradient id="r2" cx="78%" cy="72%" r="38%"><stop offset="0" stop-color="#2bb3a3" stop-opacity="0.24"/><stop offset="1" stop-color="#0e1116" stop-opacity="0"/></radialGradient>
    <style>
      text { font-family: "STHeiti", "Hiragino Sans GB", "Heiti SC", sans-serif; letter-spacing: 0; }
      .eyebrow { font-size: 34px; font-weight: 800; }
      .title { font-size: 94px; font-weight: 900; }
      .subtitle { font-size: 36px; font-weight: 700; }
    </style>
  </defs>
  <rect width="1080" height="1920" fill="#0e1116"/>
  <rect width="1080" height="1920" fill="url(#r1)"/>
  <rect width="1080" height="1920" fill="url(#r2)"/>
  <text x="72" y="222" class="eyebrow" fill="#2bb3a3">${eyebrow}</text>
  <text x="72" y="780" class="title" fill="#f8fafc">${title_a}</text>
  <text x="72" y="900" class="title" fill="#f2c14e">${title_b}</text>
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

make_title_overlay "00-intro" "MANDOPOP WOMEN / LONG CHORUS TEST" "华语女声" "10 个副歌瞬间" "本地实验样片：每段约 27 秒，保留原始音乐音频。"
render_title_segment "00-intro" "4.0" "${WORK_DIR}/segments/00-intro.mp4"

make_segment_overlay "01-gem" "#e94b35" "01 / 爆发力" "G.E.M. 邓紫棋" "高压旋律里的冲击感" "GEM鄧紫棋 / LIGHT YEARS AWAY"
render_overlay_segment "${ASSET_DIR}/01-gem.mp4" "01-gem" "${WORK_DIR}/segments/01-gem.mp4"

make_segment_overlay "02-jolin" "#2bb3a3" "02 / 舞曲能量" "蔡依林 Jolin" "节奏、态度、视觉同时出击" "JOLIN 蔡依林 / PLAY我呸"
render_overlay_segment "${ASSET_DIR}/02-jolin.mp4" "02-jolin" "${WORK_DIR}/segments/02-jolin.mp4"

make_segment_overlay "03-stefanie" "#f2c14e" "03 / 叙事感" "孙燕姿" "一句就把故事拉近" "Timeless Music / 天黑黑"
render_overlay_segment "${ASSET_DIR}/03-stefanie.mp4" "03-stefanie" "${WORK_DIR}/segments/03-stefanie.mp4"

make_segment_overlay "04-amei" "#f7f2e8" "04 / 力量和现场感" "张惠妹 A-Mei" "声线一出来，场子就热了" "ForwardMusic / 三天三夜"
render_overlay_segment "${ASSET_DIR}/04-amei.mp4" "04-amei" "${WORK_DIR}/segments/04-amei.mp4"

make_segment_overlay "05-faye" "#9ccfd8" "05 / 空灵氛围" "王菲 Faye Wong" "留白也是辨识度" "Faye Wong Official / 主角"
render_overlay_segment "${ASSET_DIR}/05-faye.mp4" "05-faye" "${WORK_DIR}/segments/05-faye.mp4"

make_segment_overlay "06-fish" "#e94b35" "06 / 温柔坚定" "梁静茹 Fish Leong" "柔软，但不是轻飘" "ROCK RECORDS / 勇气"
render_overlay_segment "${ASSET_DIR}/06-fish.mp4" "06-fish" "${WORK_DIR}/segments/06-fish.mp4"

make_segment_overlay "07-hebe" "#2bb3a3" "07 / 青春电影感" "田馥甄 Hebe" "一开口就是青春片段" "Our Times / 小幸运"
render_overlay_segment "${ASSET_DIR}/07-hebe.mp4" "07-hebe" "${WORK_DIR}/segments/07-hebe.mp4"

make_segment_overlay "08-angela" "#f2c14e" "08 / 清亮穿透" "张韶涵 Angela" "高音不是硬顶，是穿透" "福茂唱片 / 隐形的翅膀"
render_overlay_segment "${ASSET_DIR}/08-angela.mp4" "08-angela" "${WORK_DIR}/segments/08-angela.mp4"

make_segment_overlay "09-sandy" "#f7f2e8" "09 / 都市情绪" "林忆莲 Sandy Lam" "越克制，越有重量" "Timeless Music / 至少还有你"
render_overlay_segment "${ASSET_DIR}/09-sandy.mp4" "09-sandy" "${WORK_DIR}/segments/09-sandy.mp4"

make_segment_overlay "10-cyndi" "#9ccfd8" "10 / 甜酷动感" "王心凌 Cyndi" "甜不是单薄，是节奏记忆点" "avex taiwan / 爱你"
render_overlay_segment "${ASSET_DIR}/10-cyndi.mp4" "10-cyndi" "${WORK_DIR}/segments/10-cyndi.mp4"

make_title_overlay "99-closing" "NEXT TEST?" "你更想继续做" "哪类华语女声盘点？" "本条重点验证长副歌节奏，不是正式发布版。"
render_title_segment "99-closing" "5.0" "${WORK_DIR}/segments/99-closing.mp4"

cat > "${WORK_DIR}/concat.txt" <<LIST
file '${WORK_DIR}/segments/00-intro.mp4'
file '${WORK_DIR}/segments/01-gem.mp4'
file '${WORK_DIR}/segments/02-jolin.mp4'
file '${WORK_DIR}/segments/03-stefanie.mp4'
file '${WORK_DIR}/segments/04-amei.mp4'
file '${WORK_DIR}/segments/05-faye.mp4'
file '${WORK_DIR}/segments/06-fish.mp4'
file '${WORK_DIR}/segments/07-hebe.mp4'
file '${WORK_DIR}/segments/08-angela.mp4'
file '${WORK_DIR}/segments/09-sandy.mp4'
file '${WORK_DIR}/segments/10-cyndi.mp4'
file '${WORK_DIR}/segments/99-closing.mp4'
LIST

ffmpeg -v error -y -f concat -safe 0 -i "${WORK_DIR}/concat.txt" -c copy -movflags +faststart "$FINAL_OUT"

printf "%s\n" "$FINAL_OUT"
