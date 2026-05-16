#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
RAW_DIR="${ROOT_DIR}/sandbox/yt-dlp/clips/experiment-019"
PROJECT_DIR="${ROOT_DIR}/sandbox/hyperframes/experiment-019"
ASSET_DIR="${PROJECT_DIR}/assets"
OUT_DIR="${ROOT_DIR}/sandbox/exports/experiment-019"
WORK_DIR="${OUT_DIR}/ffmpeg_jay_top5_work"
FINAL_OUT="${OUT_DIR}/jay-chou-top5-vocal-difficulty-preview.mp4"
CONTACT_SHEET="${OUT_DIR}/jay-chou-top5-vocal-difficulty-contact-sheet.jpg"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

mkdir -p "${ASSET_DIR}" "${WORK_DIR}/overlays" "${WORK_DIR}/segments" "${OUT_DIR}"

find_clip() {
  local id="$1"
  find "$RAW_DIR" -maxdepth 1 -type f -name "*${id}*.mp4" | head -n 1
}

process_asset() {
  local id="$1"
  local out_name="$2"
  local fade_start="$3"
  local src
  src="$(find_clip "$id")"
  if [[ -z "$src" ]]; then
    printf "Missing source for %s\n" "$id" >&2
    exit 1
  fi

  ffmpeg -v error -y -i "$src" \
    -vf "split=2[bg][fg];[bg]scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,gblur=sigma=34,eq=brightness=-0.13:saturation=0.88[bg];[fg]scale=1080:1920:force_original_aspect_ratio=decrease[fg];[bg][fg]overlay=(W-w)/2:(H-h)/2,format=yuv420p" \
    -r 30 -c:v libx264 -preset veryfast -crf 22 -g 60 -keyint_min 60 -sc_threshold 0 \
    -af "loudnorm=I=-16:TP=-1.5:LRA=11,afade=t=in:st=0:d=0.2,afade=t=out:st=${fade_start}:d=0.55" \
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
  local note="$6"
  eyebrow="$(svg_escape "$eyebrow")"
  title_a="$(svg_escape "$title_a")"
  title_b="$(svg_escape "$title_b")"
  subtitle="$(svg_escape "$subtitle")"
  note="$(svg_escape "$note")"

  cat > "${WORK_DIR}/overlays/${file}.svg" <<SVG
<svg xmlns="http://www.w3.org/2000/svg" width="1080" height="1920" viewBox="0 0 1080 1920">
  <defs>
    <style>
      text { font-family: "STHeiti", "Hiragino Sans GB", "Heiti SC", sans-serif; letter-spacing: 0; }
      .eyebrow { font-size: 34px; font-weight: 800; }
      .title { font-size: 84px; font-weight: 900; }
      .subtitle { font-size: 34px; font-weight: 720; }
      .note { font-size: 24px; font-weight: 650; }
    </style>
  </defs>
  <rect width="1080" height="1920" fill="#0e1116"/>
  <rect x="0" y="0" width="1080" height="24" fill="#e94b35"/>
  <rect x="0" y="24" width="1080" height="16" fill="#2bb3a3"/>
  <rect x="72" y="548" width="12" height="488" fill="#f2c14e"/>
  <text x="72" y="220" class="eyebrow" fill="#2bb3a3">${eyebrow}</text>
  <text x="112" y="720" class="title" fill="#f8fafc">${title_a}</text>
  <text x="112" y="842" class="title" fill="#f2c14e">${title_b}</text>
  <text x="72" y="1642" class="subtitle" fill="#f7f2e8">${subtitle}</text>
  <text x="72" y="1706" class="note" fill="#9ccfd8">${note}</text>
</svg>
SVG
  render_svg_png "$file"
}

make_rank_overlay() {
  local file="$1"
  local accent="$2"
  local header="$3"
  local song="$4"
  local focus="$5"
  local detail_a="$6"
  local detail_b="$7"
  local source="$8"

  header="$(svg_escape "$header")"
  song="$(svg_escape "$song")"
  focus="$(svg_escape "$focus")"
  detail_a="$(svg_escape "$detail_a")"
  detail_b="$(svg_escape "$detail_b")"
  source="$(svg_escape "$source")"

  cat > "${WORK_DIR}/overlays/${file}.svg" <<SVG
<svg xmlns="http://www.w3.org/2000/svg" width="1080" height="1920" viewBox="0 0 1080 1920">
  <defs>
    <style>
      text { font-family: "STHeiti", "Hiragino Sans GB", "Heiti SC", sans-serif; letter-spacing: 0; }
      .header { font-size: 34px; font-weight: 900; }
      .song { font-size: 70px; font-weight: 900; }
      .focus { font-size: 35px; font-weight: 880; }
      .detail { font-size: 27px; font-weight: 680; }
      .source { font-size: 21px; font-weight: 650; }
    </style>
  </defs>
  <rect x="54" y="76" width="680" height="76" fill="#0e1116" opacity="0.78"/>
  <text x="78" y="126" class="header" fill="${accent}">${header}</text>
  <rect x="54" y="1240" width="972" height="420" fill="#0e1116" opacity="0.80"/>
  <rect x="54" y="1240" width="8" height="420" fill="${accent}"/>
  <text x="88" y="1340" class="song" fill="#f8fafc">${song}</text>
  <text x="88" y="1426" class="focus" fill="${accent}">${focus}</text>
  <text x="88" y="1502" class="detail" fill="#f7f2e8">${detail_a}</text>
  <text x="88" y="1562" class="detail" fill="#9ccfd8">${detail_b}</text>
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
  for t in 2 40 110 180 250 326 366; do
    printf -v name "%02d" "$idx"
    ffmpeg -v error -y -ss "$t" -i "$FINAL_OUT" -frames:v 1 "${frames_dir}/frame_${name}.png"
    idx=$((idx + 1))
  done
  ffmpeg -v error -y -pattern_type glob -i "${frames_dir}/frame_*.png" -vf "scale=180:-2,tile=7x1,format=yuvj420p" -q:v 3 "$CONTACT_SHEET"
}

process_asset "wRT-5heURhY" "01-top5-dark-humor" "71.2"
process_asset "L229QDxDakU" "02-top4-all-the-way-north" "69.2"
process_asset "qzwsQTY-99o" "03-top3-maple-leaf" "69.2"
process_asset "YJfHuATJYsQ" "04-top2-step-aside" "69.2"
process_asset "K9CbHZLXPIA" "05-top1-white-windmill" "75.2"

make_title_overlay "00-intro" "JAY CHOU / VOCAL DIFFICULTY TOP 5" "周杰伦最难的" "5首歌" "从真假声、哭腔，到连续高音耐力。" "越往后，越考声区和情绪控制。"
render_title_segment "00-intro" "5.0" "${WORK_DIR}/segments/00-intro.mp4"

make_rank_overlay "01-top5-dark-humor" "#9ccfd8" "TOP 5 / 真假声转换" "黑色幽默" "参考难点：真假声 + 转音控制" "情绪要压住，技巧还不能乱。" "一松一紧之间，状态感非常吃重。" "周杰倫 Jay Chou / Official MV"
render_overlay_segment "${ASSET_DIR}/01-top5-dark-humor.mp4" "01-top5-dark-humor" "${WORK_DIR}/segments/01-top5-dark-humor.mp4"

make_rank_overlay "02-top4-all-the-way-north" "#2bb3a3" "TOP 4 / 压抑高音" "一路向北" "参考难点：音高跨度 + 哭腔" "副歌既要顶上去，又要保留压抑感。" "普通人一用力，情绪就容易散。" "周杰倫 Jay Chou / Official MV"
render_overlay_segment "${ASSET_DIR}/02-top4-all-the-way-north.mp4" "02-top4-all-the-way-north" "${WORK_DIR}/segments/02-top4-all-the-way-north.mp4"

make_rank_overlay "03-top3-maple-leaf" "#f2c14e" "TOP 3 / 升Key耐力" "枫" "参考难点：升Key后高位稳定" "越唱越高，情绪还要一直撑住。" "难点不是爆一下，是后面不垮。" "周杰倫 Jay Chou / Official MV"
render_overlay_segment "${ASSET_DIR}/03-top3-maple-leaf.mp4" "03-top3-maple-leaf" "${WORK_DIR}/segments/03-top3-maple-leaf.mp4"

make_rank_overlay "04-top2-step-aside" "#e94b35" "TOP 2 / 持续高音" "搁浅" "参考难点：尾段副歌高位输出" "最后一段持续往上顶。" "气息和咬字一紧，就很容易破。" "周杰倫 Jay Chou / Official MV"
render_overlay_segment "${ASSET_DIR}/04-top2-step-aside.mp4" "04-top2-step-aside" "${WORK_DIR}/segments/04-top2-step-aside.mp4"

make_rank_overlay "05-top1-white-windmill" "#f7f2e8" "TOP 1 / 温柔高音" "白色风车" "参考难点：连续高音耐力" "听着轻，其实后段一直在磨嗓。" "温柔不能塌，高位还得稳。" "周杰倫 Jay Chou / Official MV"
render_overlay_segment "${ASSET_DIR}/05-top1-white-windmill.mp4" "05-top1-white-windmill" "${WORK_DIR}/segments/05-top1-white-windmill.mp4"

make_title_overlay "99-closing" "JAY CHOU / TOP 5" "真正的难唱" "不只是最高音" "还要把咬字、气息和情绪一起稳住。" "这一组，越温柔越难撑。"
render_title_segment "99-closing" "5.0" "${WORK_DIR}/segments/99-closing.mp4"

cat > "${WORK_DIR}/concat.txt" <<LIST
file '${WORK_DIR}/segments/00-intro.mp4'
file '${WORK_DIR}/segments/01-top5-dark-humor.mp4'
file '${WORK_DIR}/segments/02-top4-all-the-way-north.mp4'
file '${WORK_DIR}/segments/03-top3-maple-leaf.mp4'
file '${WORK_DIR}/segments/04-top2-step-aside.mp4'
file '${WORK_DIR}/segments/05-top1-white-windmill.mp4'
file '${WORK_DIR}/segments/99-closing.mp4'
LIST

ffmpeg -v error -y -f concat -safe 0 -i "${WORK_DIR}/concat.txt" -c copy -movflags +faststart "$FINAL_OUT"
make_contact_sheet

printf "%s\n" "$FINAL_OUT"

