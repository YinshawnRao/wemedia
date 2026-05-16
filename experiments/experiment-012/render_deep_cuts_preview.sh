#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
RAW_DIR="${ROOT_DIR}/sandbox/yt-dlp/clips/experiment-012"
PROJECT_DIR="${ROOT_DIR}/sandbox/hyperframes/experiment-012"
ASSET_DIR="${PROJECT_DIR}/assets"
OUT_DIR="${ROOT_DIR}/sandbox/exports/experiment-012"
WORK_DIR="${OUT_DIR}/ffmpeg_deep_cuts_work"
FINAL_OUT="${OUT_DIR}/angela-deep-cuts-top5-preview.mp4"
CONTACT_SHEET="${OUT_DIR}/angela-deep-cuts-top5-contact-sheet.jpg"
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
      .title { font-size: 86px; font-weight: 900; }
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
  local rank="$3"
  local song="$4"
  local lyricist="$5"
  local composer="$6"
  local note="$7"
  local source="$8"

  rank="$(svg_escape "$rank")"
  song="$(svg_escape "$song")"
  lyricist="$(svg_escape "$lyricist")"
  composer="$(svg_escape "$composer")"
  note="$(svg_escape "$note")"
  source="$(svg_escape "$source")"

  cat > "${WORK_DIR}/overlays/${file}.svg" <<SVG
<svg xmlns="http://www.w3.org/2000/svg" width="1080" height="1920" viewBox="0 0 1080 1920">
  <defs>
    <style>
      text { font-family: "STHeiti", "Hiragino Sans GB", "Heiti SC", sans-serif; letter-spacing: 0; }
      .rank { font-size: 34px; font-weight: 900; }
      .song { font-size: 76px; font-weight: 900; }
      .credit { font-size: 33px; font-weight: 760; }
      .note { font-size: 25px; font-weight: 650; }
      .source { font-size: 21px; font-weight: 650; }
    </style>
  </defs>
  <rect x="54" y="76" width="494" height="76" fill="#0e1116" opacity="0.78"/>
  <text x="78" y="126" class="rank" fill="${accent}">${rank}</text>
  <rect x="54" y="1234" width="972" height="424" fill="#0e1116" opacity="0.81"/>
  <rect x="54" y="1234" width="8" height="424" fill="${accent}"/>
  <text x="88" y="1336" class="song" fill="#f8fafc">${song}</text>
  <text x="88" y="1428" class="credit" fill="${accent}">作词：${lyricist}</text>
  <text x="88" y="1494" class="credit" fill="#f7f2e8">作曲：${composer}</text>
  <text x="88" y="1574" class="note" fill="#9ccfd8">${note}</text>
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
  for t in 2 25 68 112 155 195 218; do
    printf -v name "%02d" "$idx"
    ffmpeg -v error -y -ss "$t" -i "$FINAL_OUT" -frames:v 1 "${frames_dir}/frame_${name}.jpg"
    idx=$((idx + 1))
  done
  ffmpeg -v error -y -pattern_type glob -i "${frames_dir}/frame_*.jpg" -vf "scale=180:-1,tile=7x1" "$CONTACT_SHEET"
}

process_asset "9_nxUIB4zqo" "01-top5-amnesia" "42.2"
process_asset "gVbVBCh6xlA" "02-top4-fantasy-love" "42.2"
process_asset "iaCu-D-2vxQ" "03-top3-city-window" "45.2"
process_asset "1ETckF6OUok" "04-top2-never-surrender" "39.2"
process_asset "ORJc4ZNCPks" "05-top1-happy-sadness-day" "39.2"

make_title_overlay "00-intro" "ANGELA ZHANG / DEEP CUTS TOP 5" "张韶涵冷门歌曲" "TOP5" "你的排名，我按悬念感重新编排。" "本地实验预览：保留原曲副歌，不加旁白。"
render_title_segment "00-intro" "5.0" "${WORK_DIR}/segments/00-intro.mp4"

make_rank_overlay "01-top5-amnesia" "#9ccfd8" "TOP 5 / 冷门伤感线" "失忆" "林隆璇" "林隆璇" "副歌记忆点：拉长的情绪线，越听越后劲。" "張韶涵Angela Zhang / Official audio"
render_overlay_segment "${ASSET_DIR}/01-top5-amnesia.mp4" "01-top5-amnesia" "${WORK_DIR}/segments/01-top5-amnesia.mp4"

make_rank_overlay "02-top4-fantasy-love" "#2bb3a3" "TOP 4 / 梦里花遗珠" "幻想爱" "陈伟" "陈伟" "副歌记忆点：轻摇滚质感，甜和痛同时在。" "福茂唱片 / Official MV"
render_overlay_segment "${ASSET_DIR}/02-top4-fantasy-love.mp4" "02-top4-fantasy-love" "${WORK_DIR}/segments/02-top4-fantasy-love.mp4"

make_rank_overlay "03-top3-city-window" "#f2c14e" "TOP 3 / 世博主题曲" "城市之窗" "王雅君 / 陈瑶" "王雅君" "副歌记忆点：明亮开阔，是被低估的温暖大歌。" "張韶涵Angela Zhang / Official audio"
render_overlay_segment "${ASSET_DIR}/03-top3-city-window.mp4" "03-top3-city-window" "${WORK_DIR}/segments/03-top3-city-window.mp4"

make_rank_overlay "04-top2-never-surrender" "#e94b35" "TOP 2 / 热血应援曲" "绝不" "深白色" "深白色" "副歌记忆点：不是甜歌，是一首燃到骨子里的宣言。" "張韶涵Angela Zhang / Official audio"
render_overlay_segment "${ASSET_DIR}/04-top2-never-surrender.mp4" "04-top2-never-surrender" "${WORK_DIR}/segments/04-top2-never-surrender.mp4"

make_rank_overlay "05-top1-happy-sadness-day" "#f7f2e8" "TOP 1 / 冷门第一" "伤日快乐" "王雅君" "王雅君" "副歌记忆点：把生日写成伤日，名字就先赢一半。" "福茂唱片 / Official lyric video"
render_overlay_segment "${ASSET_DIR}/05-top1-happy-sadness-day.mp4" "05-top1-happy-sadness-day" "${WORK_DIR}/segments/05-top1-happy-sadness-day.mp4"

make_title_overlay "99-closing" "RANKING BY USER" "冷门歌不是不红" "是等人听懂" "Top1 留到最后，悬念才成立。" "后续可做：冷门情歌版 / 现场复活版 / 粉丝私藏版。"
render_title_segment "99-closing" "5.0" "${WORK_DIR}/segments/99-closing.mp4"

cat > "${WORK_DIR}/concat.txt" <<LIST
file '${WORK_DIR}/segments/00-intro.mp4'
file '${WORK_DIR}/segments/01-top5-amnesia.mp4'
file '${WORK_DIR}/segments/02-top4-fantasy-love.mp4'
file '${WORK_DIR}/segments/03-top3-city-window.mp4'
file '${WORK_DIR}/segments/04-top2-never-surrender.mp4'
file '${WORK_DIR}/segments/05-top1-happy-sadness-day.mp4'
file '${WORK_DIR}/segments/99-closing.mp4'
LIST

ffmpeg -v error -y -f concat -safe 0 -i "${WORK_DIR}/concat.txt" -c copy -movflags +faststart "$FINAL_OUT"
make_contact_sheet

printf "%s\n" "$FINAL_OUT"
