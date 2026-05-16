#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
RAW_DIR="${ROOT_DIR}/sandbox/yt-dlp/clips/experiment-011"
PROJECT_DIR="${ROOT_DIR}/sandbox/hyperframes/experiment-011"
ASSET_DIR="${PROJECT_DIR}/assets"
OUT_DIR="${ROOT_DIR}/sandbox/exports/experiment-011"
WORK_DIR="${OUT_DIR}/ffmpeg_combo_work"
FINAL_OUT="${OUT_DIR}/male-four-vocal-difficulty-preview.mp4"
CONTACT_SHEET="${OUT_DIR}/male-four-vocal-difficulty-contact-sheet.jpg"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

mkdir -p "${ASSET_DIR}" "${WORK_DIR}/overlays" "${WORK_DIR}/segments" "${OUT_DIR}"

find_clip() {
  local id="$1"
  find "$RAW_DIR" -maxdepth 1 -type f -name "*${id}*.mp4" | head -n 1
}

process_asset() {
  local id="$1"
  local out_name="$2"
  local src
  src="$(find_clip "$id")"
  if [[ -z "$src" ]]; then
    printf "Missing source for %s\n" "$id" >&2
    exit 1
  fi

  ffmpeg -v error -y -i "$src" \
    -vf "split=2[bg][fg];[bg]scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,gblur=sigma=34,eq=brightness=-0.11:saturation=0.86[bg];[fg]scale=1080:1920:force_original_aspect_ratio=decrease[fg];[bg][fg]overlay=(W-w)/2:(H-h)/2,format=yuv420p" \
    -r 30 -c:v libx264 -preset veryfast -crf 22 -g 60 -keyint_min 60 -sc_threshold 0 \
    -af "loudnorm=I=-16:TP=-1.5:LRA=11,afade=t=in:st=0:d=0.2,afade=t=out:st=39.35:d=0.55" \
    -ac 2 -ar 48000 -c:a aac -b:a 160k -movflags +faststart "${ASSET_DIR}/${out_name}.mp4"
}

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
      .title { font-size: 84px; font-weight: 900; }
      .subtitle { font-size: 34px; font-weight: 700; }
      .note { font-size: 24px; font-weight: 650; }
    </style>
  </defs>
  <rect width="1080" height="1920" fill="#0e1116"/>
  <rect x="0" y="0" width="1080" height="24" fill="#e94b35"/>
  <rect x="0" y="24" width="1080" height="16" fill="#2bb3a3"/>
  <rect x="72" y="560" width="12" height="468" fill="#f2c14e"/>
  <text x="72" y="220" class="eyebrow" fill="#2bb3a3">${eyebrow}</text>
  <text x="112" y="730" class="title" fill="#f8fafc">${title_a}</text>
  <text x="112" y="848" class="title" fill="#f2c14e">${title_b}</text>
  <text x="72" y="1648" class="subtitle" fill="#f7f2e8">${subtitle}</text>
  <text x="72" y="1710" class="note" fill="#9ccfd8">音高标注为本地参考：非官方谱面结论。</text>
</svg>
SVG
  render_svg_png "$file"
}

make_rank_overlay() {
  local file="$1"
  local accent="$2"
  local header="$3"
  local song="$4"
  local pitch="$5"
  local skill="$6"
  local science="$7"
  local source="$8"

  header="$(svg_escape "$header")"
  song="$(svg_escape "$song")"
  pitch="$(svg_escape "$pitch")"
  skill="$(svg_escape "$skill")"
  science="$(svg_escape "$science")"
  source="$(svg_escape "$source")"

  cat > "${WORK_DIR}/overlays/${file}.svg" <<SVG
<svg xmlns="http://www.w3.org/2000/svg" width="1080" height="1920" viewBox="0 0 1080 1920">
  <defs>
    <style>
      text { font-family: "STHeiti", "Hiragino Sans GB", "Heiti SC", sans-serif; letter-spacing: 0; }
      .header { font-size: 34px; font-weight: 900; }
      .song { font-size: 68px; font-weight: 900; }
      .pitch { font-size: 38px; font-weight: 880; }
      .skill { font-size: 30px; font-weight: 760; }
      .science { font-size: 25px; font-weight: 650; }
      .source { font-size: 21px; font-weight: 650; }
    </style>
  </defs>
  <rect x="54" y="76" width="560" height="76" fill="#0e1116" opacity="0.78"/>
  <text x="78" y="126" class="header" fill="${accent}">${header}</text>
  <rect x="54" y="1258" width="972" height="386" fill="#0e1116" opacity="0.80"/>
  <rect x="54" y="1258" width="8" height="386" fill="${accent}"/>
  <text x="88" y="1354" class="song" fill="#f8fafc">${song}</text>
  <text x="88" y="1436" class="pitch" fill="${accent}">${pitch}</text>
  <text x="88" y="1510" class="skill" fill="#f7f2e8">${skill}</text>
  <text x="88" y="1570" class="science" fill="#9ccfd8">${science}</text>
  <rect x="54" y="1772" width="972" height="64" fill="#0e1116" opacity="0.68"/>
  <rect x="78" y="1801" width="118" height="5" fill="${accent}"/>
  <text x="218" y="1814" class="source" fill="#f7f2e8">${source}</text>
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

make_contact_sheet() {
  local frames_dir="${OUT_DIR}/contact_frames"
  mkdir -p "$frames_dir"
  local idx=0
  for t in 2 22 62 102 142 167; do
    printf -v name "%02d" "$idx"
    ffmpeg -v error -y -ss "$t" -i "$FINAL_OUT" -frames:v 1 "${frames_dir}/frame_${name}.jpg"
    idx=$((idx + 1))
  done
  ffmpeg -v error -y -pattern_type glob -i "${frames_dir}/frame_*.jpg" -vf "scale=180:-1,tile=6x1" "$CONTACT_SHEET"
}

process_asset "YJfHuATJYsQ" "01-jay-geqian"
process_asset "_OP1roi1_Fs" "02-leehom-nibuzai"
process_asset "VC4KT__tx5g" "03-david-blacktangerine"
process_asset "gd38-X3HpbM" "04-jj-twilight"

make_title_overlay "00-intro" "MALE VOCAL DIFFICULTY / 4 SINGERS" "四位男歌手" "难唱代表作" "一人一首，听他们各自难在哪里。"
render_title_segment "00-intro" "5.0" "${WORK_DIR}/segments/00-intro.mp4"

make_rank_overlay "01-jay-geqian" "#e94b35" "周杰伦 / 高位咬字" "搁浅" "参考峰值：A4-B4 区间" "难点：高位副歌 + 咬字压力" "科普：周氏唱法难在字要糊得有味，但音准不能糊。" "周杰倫 Jay Chou / 搁浅 Official MV"
render_overlay_segment "${ASSET_DIR}/01-jay-geqian.mp4" "01-jay-geqian" "${WORK_DIR}/segments/01-jay-geqian.mp4"

make_rank_overlay "02-leehom-nibuzai" "#f2c14e" "王力宏 / 大跳强混" "你不在" "参考峰值：B4-C#5 区间" "难点：强混声 + 大跳音程" "科普：旋律跨度越大，换声点越容易露破绽。" "王力宏 Wang Leehom / 你不在 Official MV"
render_overlay_segment "${ASSET_DIR}/02-leehom-nibuzai.mp4" "02-leehom-nibuzai" "${WORK_DIR}/segments/02-leehom-nibuzai.mp4"

make_rank_overlay "03-david-blacktangerine" "#2bb3a3" "陶喆 / 摇滚律动" "黑色柳丁" "参考峰值：A4-B4 区间" "难点：摇滚声压 + R&B 律动" "科普：陶喆难在 groove，重音、转音和咬字都要卡在拍子里。" "Timeless Music / 黑色柳丁 Official MV"
render_overlay_segment "${ASSET_DIR}/03-david-blacktangerine.mp4" "03-david-blacktangerine" "${WORK_DIR}/segments/03-david-blacktangerine.mp4"

make_rank_overlay "04-jj-twilight" "#9ccfd8" "林俊杰 / 高位长线" "不为谁而作的歌" "参考峰值：C5-D5 区间" "难点：高位混声 + 长线支撑" "科普：JJ 的难是高音要亮，还要像录音棚一样稳。" "JJ Lin林俊傑 / Twilight Official HD MV"
render_overlay_segment "${ASSET_DIR}/04-jj-twilight.mp4" "04-jj-twilight" "${WORK_DIR}/segments/04-jj-twilight.mp4"

make_title_overlay "99-closing" "REFERENCE ONLY" "不是谁更强" "是难法不同" "后续可做：KTV挑战版 / 现场稳定度版 / 换声点拆解。"
render_title_segment "99-closing" "5.0" "${WORK_DIR}/segments/99-closing.mp4"

cat > "${WORK_DIR}/concat.txt" <<LIST
file '${WORK_DIR}/segments/00-intro.mp4'
file '${WORK_DIR}/segments/01-jay-geqian.mp4'
file '${WORK_DIR}/segments/02-leehom-nibuzai.mp4'
file '${WORK_DIR}/segments/03-david-blacktangerine.mp4'
file '${WORK_DIR}/segments/04-jj-twilight.mp4'
file '${WORK_DIR}/segments/99-closing.mp4'
LIST

ffmpeg -v error -y -f concat -safe 0 -i "${WORK_DIR}/concat.txt" -c copy -movflags +faststart "$FINAL_OUT"
make_contact_sheet

printf "%s\n" "$FINAL_OUT"
