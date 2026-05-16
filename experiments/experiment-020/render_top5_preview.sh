#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
RAW_DIR="${ROOT_DIR}/sandbox/yt-dlp/clips/experiment-020"
PROJECT_DIR="${ROOT_DIR}/sandbox/hyperframes/experiment-020"
ASSET_DIR="${PROJECT_DIR}/assets"
OUT_DIR="${ROOT_DIR}/sandbox/exports/experiment-020"
WORK_DIR="${OUT_DIR}/ffmpeg_angela_2026_top5_work"
FINAL_OUT="${OUT_DIR}/angela-2026-top5-vocal-difficulty-preview.mp4"
CONTACT_SHEET="${OUT_DIR}/angela-2026-top5-vocal-difficulty-contact-sheet.jpg"
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
  for t in 2 42 112 184 244 314 353; do
    printf -v name "%02d" "$idx"
    ffmpeg -v error -y -ss "$t" -i "$FINAL_OUT" -frames:v 1 "${frames_dir}/frame_${name}.png"
    idx=$((idx + 1))
  done
  ffmpeg -v error -y -pattern_type glob -i "${frames_dir}/frame_*.png" -vf "scale=180:-2,tile=7x1,format=yuvj420p" -q:v 3 "$CONTACT_SHEET"
}

process_asset "4FsAGbLe_LU" "01-top5-kite" "71.2"
process_asset "5yR3L5_zI1w" "02-top4-exhaustion" "75.2"
process_asset "BdWUZmEVRmU" "03-top3-head-over-heels" "57.2"
process_asset "e1_4y8RJ5xU" "04-top2-break-cocoon" "65.2"
process_asset "Oq3dVBEdc4M" "05-top1-adiao" "72.2"

make_title_overlay "00-intro" "ANGELA ZHANG / VOCAL DIFFICULTY TOP 5" "张韶涵最难的" "5首歌" "从明亮高音、强混，到现场情绪爆发。" "越往后，越考声区、气息和稳定度。"
render_title_segment "00-intro" "5.0" "${WORK_DIR}/segments/00-intro.mp4"

make_rank_overlay "01-top5-kite" "#9ccfd8" "TOP 5 / 明亮高位" "引路的风筝" "参考难点：高音上行 + 叙事感" "高音一路往上顶，不能只靠喊。" "明亮、力量和故事感都要在线。" "張韶涵Angela Zhang / Official video"
render_overlay_segment "${ASSET_DIR}/01-top5-kite.mp4" "01-top5-kite" "${WORK_DIR}/segments/01-top5-kite.mp4"

make_rank_overlay "02-top4-exhaustion" "#2bb3a3" "TOP 4 / 暗色推进" "无度" "参考难点：低高反差 + 后段爆发" "低处要沉，高处要稳稳打开。" "情绪一推进，很容易唱散。" "張韶涵Angela Zhang / Official Video"
render_overlay_segment "${ASSET_DIR}/02-top4-exhaustion.mp4" "02-top4-exhaustion" "${WORK_DIR}/segments/02-top4-exhaustion.mp4"

make_rank_overlay "03-top3-head-over-heels" "#f2c14e" "TOP 3 / 轻快体能局" "全面沦陷" "参考难点：跨度大 + 音区跳跃" "节奏轻快，但低高落差很凶。" "甜歌外衣下面，是体能和亮度考验。" "張韶涵Angela Zhang / Official MV"
render_overlay_segment "${ASSET_DIR}/03-top3-head-over-heels.mp4" "03-top3-head-over-heels" "${WORK_DIR}/segments/03-top3-head-over-heels.mp4"

make_rank_overlay "04-top2-break-cocoon" "#e94b35" "TOP 2 / 爆发穿透" "破茧" "参考难点：副歌爆发 + 穿透感" "主歌压住叙事，副歌瞬间拉开。" "音域、力量和续航都很吃硬实力。" "Dreamer Music / Official MV"
render_overlay_segment "${ASSET_DIR}/04-top2-break-cocoon.mp4" "04-top2-break-cocoon" "${WORK_DIR}/segments/04-top2-break-cocoon.mp4"

make_rank_overlay "05-top1-adiao" "#f7f2e8" "TOP 1 / 换声区强混" "阿刁" "参考难点：强混长音 + 情绪爆发" "全程卡在换声区，还要持续顶住。" "高音、长线和现场情绪一起拉满。" "芒果TV音乐 / Singer 2018"
render_overlay_segment "${ASSET_DIR}/05-top1-adiao.mp4" "05-top1-adiao" "${WORK_DIR}/segments/05-top1-adiao.mp4"

make_title_overlay "99-closing" "ANGELA ZHANG / TOP 5" "真正的难唱" "不是只看能不能喊上去" "还要把力量、明亮度和叙事感一起稳住。" "这一组，越到后面越考硬实力。"
render_title_segment "99-closing" "5.0" "${WORK_DIR}/segments/99-closing.mp4"

cat > "${WORK_DIR}/concat.txt" <<LIST
file '${WORK_DIR}/segments/00-intro.mp4'
file '${WORK_DIR}/segments/01-top5-kite.mp4'
file '${WORK_DIR}/segments/02-top4-exhaustion.mp4'
file '${WORK_DIR}/segments/03-top3-head-over-heels.mp4'
file '${WORK_DIR}/segments/04-top2-break-cocoon.mp4'
file '${WORK_DIR}/segments/05-top1-adiao.mp4'
file '${WORK_DIR}/segments/99-closing.mp4'
LIST

ffmpeg -v error -y -f concat -safe 0 -i "${WORK_DIR}/concat.txt" -c copy -movflags +faststart "$FINAL_OUT"
make_contact_sheet

printf "%s\n" "$FINAL_OUT"
