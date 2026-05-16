#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
RAW_DIR="${ROOT_DIR}/sandbox/yt-dlp/clips/experiment-016"
PROJECT_DIR="${ROOT_DIR}/sandbox/hyperframes/experiment-016"
ASSET_DIR="${PROJECT_DIR}/assets"
OUT_DIR="${ROOT_DIR}/sandbox/exports/experiment-016"
WORK_DIR="${OUT_DIR}/ffmpeg_jj_lin_top5_work"
FINAL_OUT="${OUT_DIR}/jj-lin-top5-vocal-difficulty-preview.mp4"
CONTACT_SHEET="${OUT_DIR}/jj-lin-top5-vocal-difficulty-contact-sheet.jpg"
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
    -vf "split=2[bg][fg];[bg]scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,gblur=sigma=34,eq=brightness=-0.12:saturation=0.88[bg];[fg]scale=1080:1920:force_original_aspect_ratio=decrease[fg];[bg][fg]overlay=(W-w)/2:(H-h)/2,format=yuv420p" \
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
  for t in 2 33 88 148 211 279 313; do
    printf -v name "%02d" "$idx"
    ffmpeg -v error -y -ss "$t" -i "$FINAL_OUT" -frames:v 1 "${frames_dir}/frame_${name}.png"
    idx=$((idx + 1))
  done
  ffmpeg -v error -y -pattern_type glob -i "${frames_dir}/frame_*.png" -vf "scale=180:-2,tile=7x1,format=yuvj420p" -q:v 3 "$CONTACT_SHEET"
}

process_asset "CEqwRGpHINc" "01-top5-unable-to-control" "55.2"
process_asset "1CFQ1t5WqeY" "02-top4-infinity-and-beyond" "55.2"
process_asset "gd38-X3HpbM" "03-top3-twilight" "63.2"
process_asset "27R6ZavdzzQ" "04-top2-never-learn" "58.2"
process_asset "NeRSqC1xuDI" "05-top1-unchained" "70.2"

make_title_overlay "00-intro" "JJ LIN / VOCAL DIFFICULTY TOP 5" "林俊杰最难的" "5首歌" "从 Top5 到 Top1，一路听到声区极限。" "强混、换声、气息、转音，层层加码。"
render_title_segment "00-intro" "5.0" "${WORK_DIR}/segments/00-intro.mp4"

make_rank_overlay "01-top5-unable-to-control" "#9ccfd8" "TOP 5 / 真假声切换" "无法克制" "参考难点：真假声极速转换" "音域跨度大，转音需要精细控制。" "轻声和真声一衔接，稳定度立刻见真章。" "JJ Lin林俊傑 / Official audio"
render_overlay_segment "${ASSET_DIR}/01-top5-unable-to-control.mp4" "01-top5-unable-to-control" "${WORK_DIR}/segments/01-top5-unable-to-control.mp4"

make_rank_overlay "02-top4-infinity-and-beyond" "#2bb3a3" "TOP 4 / 快速强混" "超越无限" "参考难点：高腔叠加快节奏" "强混声持续发力，咬字不能松。" "速度越快，气息和位置越难稳。" "JJ Lin林俊傑 / Official MV"
render_overlay_segment "${ASSET_DIR}/02-top4-infinity-and-beyond.mp4" "02-top4-infinity-and-beyond" "${WORK_DIR}/segments/02-top4-infinity-and-beyond.mp4"

make_rank_overlay "03-top3-twilight" "#f2c14e" "TOP 3 / 连续高音" "不为谁而作的歌" "参考难点：高音扎堆 + 换气少" "副歌一路推高，气口非常紧。" "唱功续航比单个高音更难。" "JJ Lin林俊傑 / Official MV"
render_overlay_segment "${ASSET_DIR}/03-top3-twilight.mp4" "03-top3-twilight" "${WORK_DIR}/segments/03-top3-twilight.mp4"

make_rank_overlay "04-top2-never-learn" "#e94b35" "TOP 2 / 换声区长线" "学不会" "参考难点：换声区持续受压" "长音高音反复卡点，支撑不能塌。" "稍微用力过头就容易紧和破。" "Warner Music Taiwan / Official MV"
render_overlay_segment "${ASSET_DIR}/04-top2-never-learn.mp4" "04-top2-never-learn" "${WORK_DIR}/segments/04-top2-never-learn.mp4"

make_rank_overlay "05-top1-unchained" "#f7f2e8" "TOP 1 / 超高音密集" "无拘" "参考难点：混声转换 + 气息消耗" "尾段持续向上顶，声区转换极密。" "高音、强度和体力同时拉满。" "JJ Lin林俊傑 / Official MV"
render_overlay_segment "${ASSET_DIR}/05-top1-unchained.mp4" "05-top1-unchained" "${WORK_DIR}/segments/05-top1-unchained.mp4"

make_title_overlay "99-closing" "JJ LIN / TOP 5" "真正的难唱" "不是只看最高音" "是强混、换声、咬字和续航一起稳住。" "这一组，越到最后越费嗓。"
render_title_segment "99-closing" "5.0" "${WORK_DIR}/segments/99-closing.mp4"

cat > "${WORK_DIR}/concat.txt" <<LIST
file '${WORK_DIR}/segments/00-intro.mp4'
file '${WORK_DIR}/segments/01-top5-unable-to-control.mp4'
file '${WORK_DIR}/segments/02-top4-infinity-and-beyond.mp4'
file '${WORK_DIR}/segments/03-top3-twilight.mp4'
file '${WORK_DIR}/segments/04-top2-never-learn.mp4'
file '${WORK_DIR}/segments/05-top1-unchained.mp4'
file '${WORK_DIR}/segments/99-closing.mp4'
LIST

ffmpeg -v error -y -f concat -safe 0 -i "${WORK_DIR}/concat.txt" -c copy -movflags +faststart "$FINAL_OUT"
make_contact_sheet

printf "%s\n" "$FINAL_OUT"
