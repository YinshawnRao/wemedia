#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
RAW_DIR="${ROOT_DIR}/sandbox/yt-dlp/clips/experiment-023"
PROJECT_DIR="${ROOT_DIR}/sandbox/hyperframes/experiment-023"
ASSET_DIR="${PROJECT_DIR}/assets"
OUT_DIR="${ROOT_DIR}/sandbox/exports/experiment-023"
WORK_DIR="${OUT_DIR}/ffmpeg_steve_chou_others_work"
FINAL_OUT="${OUT_DIR}/steve-chou-songs-for-others-top5-preview.mp4"
CONTACT_SHEET="${OUT_DIR}/steve-chou-songs-for-others-top5-contact-sheet.jpg"
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
  local performer="$5"
  local credits="$6"
  local detail="$7"
  local source="$8"

  header="$(svg_escape "$header")"
  song="$(svg_escape "$song")"
  performer="$(svg_escape "$performer")"
  credits="$(svg_escape "$credits")"
  detail="$(svg_escape "$detail")"
  source="$(svg_escape "$source")"

  cat > "${WORK_DIR}/overlays/${file}.svg" <<SVG
<svg xmlns="http://www.w3.org/2000/svg" width="1080" height="1920" viewBox="0 0 1080 1920">
  <defs>
    <style>
      text { font-family: "STHeiti", "Hiragino Sans GB", "Heiti SC", sans-serif; letter-spacing: 0; }
      .header { font-size: 34px; font-weight: 900; }
      .song { font-size: 58px; font-weight: 900; }
      .performer { font-size: 34px; font-weight: 880; }
      .detail { font-size: 27px; font-weight: 680; }
      .source { font-size: 21px; font-weight: 650; }
    </style>
  </defs>
  <rect x="54" y="76" width="720" height="76" fill="#0e1116" opacity="0.78"/>
  <text x="78" y="126" class="header" fill="${accent}">${header}</text>
  <rect x="54" y="1212" width="972" height="448" fill="#0e1116" opacity="0.82"/>
  <rect x="54" y="1212" width="8" height="448" fill="${accent}"/>
  <text x="88" y="1316" class="song" fill="#f8fafc">${song}</text>
  <text x="88" y="1402" class="performer" fill="${accent}">${performer}</text>
  <text x="88" y="1480" class="detail" fill="#f7f2e8">${credits}</text>
  <text x="88" y="1542" class="detail" fill="#9ccfd8">${detail}</text>
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
  for t in 2 28 72 118 174 250 296; do
    printf -v name "%02d" "$idx"
    ffmpeg -v error -y -ss "$t" -i "$FINAL_OUT" -frames:v 1 "${frames_dir}/frame_${name}.png"
    idx=$((idx + 1))
  done
  ffmpeg -v error -y -pattern_type glob -i "${frames_dir}/frame_*.png" -vf "scale=180:-2,tile=7x1,format=yuvj420p" -q:v 3 "$CONTACT_SHEET"
}

process_asset "4P64Mb9UX74" "01-top5-flower-fragrance" "45.2"
process_asset "2l4X4lGP_Zk" "02-top4-wo-nan-guo" "40.2"
process_asset "wuC41ukQyrI" "03-top3-ji-shi-ben" "47.2"
process_asset "6RT_Fpy1__s" "04-top2-betray" "67.2"
process_asset "p9lNpWa4OXU" "05-top1-any-song-reminds-you" "84.2"

make_title_overlay "00-intro" "STEVE CHOU / SONGS FOR OTHERS TOP 5" "周传雄为别人创作的" "歌TOP5" "KTV 情歌、台偶 OST、都市伤感和集体回忆。" "这些副歌，都有小刚写歌的狠准。"
render_title_segment "00-intro" "5.0" "${WORK_DIR}/segments/00-intro.mp4"

make_rank_overlay "01-top5-flower-fragrance" "#9ccfd8" "TOP 5 / 台偶花香" "花香" "演唱：许绍洋" "作词：陈信荣 / 作曲：周传雄" "旋律一响，薰衣草的风就吹回来。" "滾石唱片 ROCK RECORDS / Official MV"
render_overlay_segment "${ASSET_DIR}/01-top5-flower-fragrance.mp4" "01-top5-flower-fragrance" "${WORK_DIR}/segments/01-top5-flower-fragrance.mp4"

make_rank_overlay "02-top4-wo-nan-guo" "#2bb3a3" "TOP 4 / 青春台剧OST" "我难过" "演唱：5566" "作词：陈信荣 / 作曲：周传雄" "副歌一出来，青春台剧 DNA 直接启动。" "Historical MV upload / Rights review"
render_overlay_segment "${ASSET_DIR}/02-top4-wo-nan-guo.mp4" "02-top4-wo-nan-guo" "${WORK_DIR}/segments/02-top4-wo-nan-guo.mp4"

make_rank_overlay "03-top3-ji-shi-ben" "#f2c14e" "TOP 3 / KTV苦情经典" "记事本" "演唱：陈慧琳" "词：周传雄/陈信荣  曲：周传雄" "旋律很简单，但记忆点扎得很深。" "福茂唱片 / Official MV"
render_overlay_segment "${ASSET_DIR}/03-top3-ji-shi-ben.mp4" "03-top3-ji-shi-ben" "${WORK_DIR}/segments/03-top3-ji-shi-ben.mp4"

make_rank_overlay "04-top2-betray" "#e94b35" "TOP 2 / 都市情歌利刃" "出卖" "演唱：那英" "作词：林夕 / 作曲：周传雄" "副歌抓耳又带刀，清醒和崩溃都很直接。" "Timeless Music / Official MV"
render_overlay_segment "${ASSET_DIR}/04-top2-betray.mp4" "04-top2-betray" "${WORK_DIR}/segments/04-top2-betray.mp4"

make_rank_overlay "05-top1-any-song-reminds-you" "#f7f2e8" "TOP 1 / 集体回忆杀" "有没有一首歌会让你想起我" "演唱：周华健" "词：李宗盛/李焯雄  曲：周传雄" "旋律一响，就是一整代人的合唱记忆。" "滾石唱片 ROCK RECORDS / Official MV"
render_overlay_segment "${ASSET_DIR}/05-top1-any-song-reminds-you.mp4" "05-top1-any-song-reminds-you" "${WORK_DIR}/segments/05-top1-any-song-reminds-you.mp4"

make_title_overlay "99-closing" "STEVE CHOU / TOP 5" "周传雄写给别人的歌" "也藏着他的情歌手感" "旋律不复杂，但副歌一到就会被记住。" "哪一首最能代表你的青春回忆？"
render_title_segment "99-closing" "5.0" "${WORK_DIR}/segments/99-closing.mp4"

cat > "${WORK_DIR}/concat.txt" <<LIST
file '${WORK_DIR}/segments/00-intro.mp4'
file '${WORK_DIR}/segments/01-top5-flower-fragrance.mp4'
file '${WORK_DIR}/segments/02-top4-wo-nan-guo.mp4'
file '${WORK_DIR}/segments/03-top3-ji-shi-ben.mp4'
file '${WORK_DIR}/segments/04-top2-betray.mp4'
file '${WORK_DIR}/segments/05-top1-any-song-reminds-you.mp4'
file '${WORK_DIR}/segments/99-closing.mp4'
LIST

ffmpeg -v error -y -f concat -safe 0 -i "${WORK_DIR}/concat.txt" -c copy -movflags +faststart "$FINAL_OUT"
make_contact_sheet

printf "%s\n" "$FINAL_OUT"

