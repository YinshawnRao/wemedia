#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
RAW_DIR="${ROOT_DIR}/sandbox/yt-dlp/clips/experiment-010"
PROJECT_DIR="${ROOT_DIR}/sandbox/hyperframes/experiment-010"
ASSET_DIR="${PROJECT_DIR}/assets"
OUT_DIR="${ROOT_DIR}/sandbox/exports/experiment-010"
WORK_DIR="${OUT_DIR}/ffmpeg_top5_work"
FINAL_OUT="${OUT_DIR}/amei-top5-vocal-difficulty-preview.mp4"
CONTACT_SHEET="${OUT_DIR}/amei-top5-vocal-difficulty-contact-sheet.jpg"
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
      .title { font-size: 88px; font-weight: 900; }
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
  local rank="$3"
  local song="$4"
  local pitch="$5"
  local skill="$6"
  local science="$7"
  local source="$8"

  rank="$(svg_escape "$rank")"
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
      .rank { font-size: 34px; font-weight: 900; }
      .song { font-size: 68px; font-weight: 900; }
      .pitch { font-size: 38px; font-weight: 880; }
      .skill { font-size: 30px; font-weight: 760; }
      .science { font-size: 25px; font-weight: 650; }
      .source { font-size: 21px; font-weight: 650; }
    </style>
  </defs>
  <rect x="54" y="76" width="540" height="76" fill="#0e1116" opacity="0.78"/>
  <text x="78" y="126" class="rank" fill="${accent}">${rank}</text>
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
  for t in 2 22 62 102 142 182 207; do
    printf -v name "%02d" "$idx"
    ffmpeg -v error -y -ss "$t" -i "$FINAL_OUT" -frames:v 1 "${frames_dir}/frame_${name}.jpg"
    idx=$((idx + 1))
  done
  ffmpeg -v error -y -pattern_type glob -i "${frames_dir}/frame_*.jpg" -vf "scale=180:-1,tile=7x1" "$CONTACT_SHEET"
}

process_asset "NFHb0OwmE-0" "01-santiansanye"
process_asset "1dyRJJzlwQ8" "02-diaole"
process_asset "mLk61pfiHQ0" "03-tinghai"
process_asset "ZH9k3643BH8" "04-jianai"
process_asset "YloYq5cZRig" "05-yexumingtian"

make_title_overlay "00-intro" "A-MEI / VOCAL DIFFICULTY TOP 5" "张惠妹歌曲" "演唱难度 TOP5" "每段取高音/高难度片段，配音乐科普备注。"
render_title_segment "00-intro" "5.0" "${WORK_DIR}/segments/00-intro.mp4"

make_rank_overlay "01-santiansanye" "#e94b35" "TOP 1 / 体力爆发" "三天三夜" "参考峰值：D5-E5 区间" "难点：高强度连唱 + 强混声爆发" "科普：这类歌不是一两个高音，而是整段都不能掉声压。" "豐華唱片 / 三天三夜 Official MV"
render_overlay_segment "${ASSET_DIR}/01-santiansanye.mp4" "01-santiansanye" "${WORK_DIR}/segments/01-santiansanye.mp4"

make_rank_overlay "02-diaole" "#f2c14e" "TOP 2 / 摇滚强压" "掉了" "参考峰值：C#5-D5 区间" "难点：摇滚咬字 + 强声压" "科普：重咬字还要保持穿透，喉头和支撑都不能乱。" "Timeless Music / 掉了 Official MV"
render_overlay_segment "${ASSET_DIR}/02-diaole.mp4" "02-diaole" "${WORK_DIR}/segments/02-diaole.mp4"

make_rank_overlay "03-tinghai" "#2bb3a3" "TOP 3 / 长线强混" "听海" "参考峰值：C5-D5 区间" "难点：长线副歌 + 哭腔强混" "科普：哭腔和强混叠在一起，最怕音准和气息一起松。" "豐華唱片 / 听海 Official MV"
render_overlay_segment "${ASSET_DIR}/03-tinghai.mp4" "03-tinghai" "${WORK_DIR}/segments/03-tinghai.mp4"

make_rank_overlay "04-jianai" "#9ccfd8" "TOP 4 / 动态控制" "剪爱" "参考峰值：B4-C#5 区间" "难点：高位长句 + 尾段推进" "科普：真正难的是从收着唱，一路推到情绪顶点。" "豐華唱片 / 剪爱 Official MV"
render_overlay_segment "${ASSET_DIR}/04-jianai.mp4" "04-jianai" "${WORK_DIR}/segments/04-jianai.mp4"

make_rank_overlay "05-yexumingtian" "#f7f2e8" "TOP 5 / 大歌叙事" "也许明天" "参考峰值：B4-C5 区间" "难点：持续高位 + 尾句稳定" "科普：大歌不是只飙高，句尾还要稳住音色和情绪。" "Timeless Music / 也许明天 Official MV"
render_overlay_segment "${ASSET_DIR}/05-yexumingtian.mp4" "05-yexumingtian" "${WORK_DIR}/segments/05-yexumingtian.mp4"

make_title_overlay "99-closing" "REFERENCE ONLY" "阿妹的难" "是力量撑到底" "后续可做：现场版体力线 / 强混声逐句拆解 / KTV挑战版。"
render_title_segment "99-closing" "5.0" "${WORK_DIR}/segments/99-closing.mp4"

cat > "${WORK_DIR}/concat.txt" <<LIST
file '${WORK_DIR}/segments/00-intro.mp4'
file '${WORK_DIR}/segments/01-santiansanye.mp4'
file '${WORK_DIR}/segments/02-diaole.mp4'
file '${WORK_DIR}/segments/03-tinghai.mp4'
file '${WORK_DIR}/segments/04-jianai.mp4'
file '${WORK_DIR}/segments/05-yexumingtian.mp4'
file '${WORK_DIR}/segments/99-closing.mp4'
LIST

ffmpeg -v error -y -f concat -safe 0 -i "${WORK_DIR}/concat.txt" -c copy -movflags +faststart "$FINAL_OUT"
make_contact_sheet

printf "%s\n" "$FINAL_OUT"
