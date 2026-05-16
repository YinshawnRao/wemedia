#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
RAW_DIR="${ROOT_DIR}/sandbox/yt-dlp/clips/experiment-007"
PROJECT_DIR="${ROOT_DIR}/sandbox/hyperframes/experiment-007"
ASSET_DIR="${PROJECT_DIR}/assets"
OUT_DIR="${ROOT_DIR}/sandbox/exports/experiment-007"
WORK_DIR="${OUT_DIR}/ffmpeg_series_work"
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
    -vf "split=2[bg][fg];[bg]scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,gblur=sigma=34,eq=brightness=-0.10:saturation=0.85[bg];[fg]scale=1080:1920:force_original_aspect_ratio=decrease[fg];[bg][fg]overlay=(W-w)/2:(H-h)/2,format=yuv420p" \
    -r 30 -c:v libx264 -preset veryfast -crf 22 -g 60 -keyint_min 60 -sc_threshold 0 \
    -af "loudnorm=I=-16:TP=-1.5:LRA=11,afade=t=in:st=0:d=0.25,afade=t=out:st=44.35:d=0.55" \
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
      .subtitle { font-size: 35px; font-weight: 700; }
    </style>
  </defs>
  <rect width="1080" height="1920" fill="#0e1116"/>
  <rect x="0" y="0" width="1080" height="24" fill="#e94b35"/>
  <rect x="0" y="24" width="1080" height="16" fill="#2bb3a3"/>
  <rect x="72" y="570" width="12" height="452" fill="#f2c14e"/>
  <text x="72" y="222" class="eyebrow" fill="#2bb3a3">${eyebrow}</text>
  <text x="112" y="740" class="title" fill="#f8fafc">${title_a}</text>
  <text x="112" y="858" class="title" fill="#f2c14e">${title_b}</text>
  <text x="72" y="1668" class="subtitle" fill="#f7f2e8">${subtitle}</text>
</svg>
SVG
  render_svg_png "$file"
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
      .small { font-size: 31px; font-weight: 800; }
      .song { font-size: 64px; font-weight: 900; }
      .tag { font-size: 35px; font-weight: 800; }
      .note { font-size: 29px; font-weight: 650; }
      .source { font-size: 22px; font-weight: 650; }
    </style>
  </defs>
  <rect x="54" y="82" width="520" height="70" fill="#0e1116" opacity="0.74"/>
  <text x="78" y="127" class="small" fill="${accent}">${number}</text>
  <rect x="54" y="1342" width="972" height="302" fill="#0e1116" opacity="0.78"/>
  <rect x="54" y="1342" width="8" height="302" fill="${accent}"/>
  <text x="88" y="1436" class="song" fill="#f8fafc">${song}</text>
  <text x="88" y="1514" class="tag" fill="#f7f2e8">${tag}</text>
  <text x="88" y="1576" class="note" fill="#f7f2e8">${note}</text>
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

concat_segments() {
  local list="$1"
  local output="$2"
  ffmpeg -v error -y -f concat -safe 0 -i "$list" -c copy -movflags +faststart "$output"
}

make_contact_sheet() {
  local video="$1"
  local sheet="$2"
  local frames_dir="$3"
  shift 3
  mkdir -p "$frames_dir"
  local idx=0
  for t in "$@"; do
    printf -v name "%02d" "$idx"
    ffmpeg -v error -y -ss "$t" -i "$video" -frames:v 1 "${frames_dir}/frame_${name}.jpg"
    idx=$((idx + 1))
  done
  ffmpeg -v error -y -pattern_type glob -i "${frames_dir}/frame_*.jpg" -vf "scale=180:-1,tile=${idx}x1" "$sheet"
}

process_asset "-4eJy_cpvoo" "01-yuyan"
process_asset "dmwJaG-R1iM" "02-aurora"
process_asset "be2wvNFTLMc" "03-wings"
process_asset "JMQOlI5-dRU" "04-dream-flower"
process_asset "RdRsVog0y2w" "05-farthest-place"
process_asset "WTcodZDH-Oc" "06-keep-walking"
process_asset "HwF1i_6Iwp8" "07-not-love"
process_asset "sh4BwEDtRI0" "08-lost-beauty"
process_asset "YaJWn-Spxfc" "09-dont-understand"
process_asset "LbDVqYaQboY" "10-sun-in-palm"

make_title_overlay "a-00" "ANGELA ZHANG / VOICE POWER" "张韶涵" "清亮高音的穿透力" "更长版本：五首歌，每段约 45 秒。"
render_title_segment "a-00" "4.0" "${WORK_DIR}/segments/a-00.mp4"
make_segment_overlay "a-01" "#e94b35" "01 / 开场辨识度" "寓言" "声线一亮，画面就立住" "高音不是只往上，而是把旋律推开。" "福茂唱片 / 寓言 Official MV"
render_overlay_segment "${ASSET_DIR}/01-yuyan.mp4" "a-01" "${WORK_DIR}/segments/a-01.mp4"
make_segment_overlay "a-02" "#2bb3a3" "02 / 早期记忆点" "欧若拉" "清亮感和流行旋律一起发光" "这类副歌很适合做短视频开场记忆点。" "福茂唱片 / 欧若拉 Official MV"
render_overlay_segment "${ASSET_DIR}/02-aurora.mp4" "a-02" "${WORK_DIR}/segments/a-02.mp4"
make_segment_overlay "a-03" "#f2c14e" "03 / 穿透型高音" "隐形的翅膀" "不是厚嗓压人，是直接穿过去" "高音和歌词一起服务情绪。" "福茂唱片 / 隐形的翅膀 Official MV"
render_overlay_segment "${ASSET_DIR}/03-wings.mp4" "a-03" "${WORK_DIR}/segments/a-03.mp4"
make_segment_overlay "a-04" "#f7f2e8" "04 / 空灵抒情" "梦里花" "轻，但不飘" "她适合把柔软唱出轮廓。" "福茂唱片 / 梦里花 Official MV"
render_overlay_segment "${ASSET_DIR}/04-dream-flower.mp4" "a-04" "${WORK_DIR}/segments/a-04.mp4"
make_segment_overlay "a-05" "#9ccfd8" "05 / 远望感" "看得最远的地方" "把清亮声线唱成开阔感" "专题可以在这里从高音转向成长。" "福茂唱片 / 看得最远的地方 Official MV"
render_overlay_segment "${ASSET_DIR}/05-farthest-place.mp4" "a-05" "${WORK_DIR}/segments/a-05.mp4"
make_title_overlay "a-99" "NEXT CUT" "这版适合做" "高音穿透专题" "下一轮可以换现场版，比较录音室和舞台表现。"
render_title_segment "a-99" "5.0" "${WORK_DIR}/segments/a-99.mp4"
cat > "${WORK_DIR}/a-concat.txt" <<LIST
file '${WORK_DIR}/segments/a-00.mp4'
file '${WORK_DIR}/segments/a-01.mp4'
file '${WORK_DIR}/segments/a-02.mp4'
file '${WORK_DIR}/segments/a-03.mp4'
file '${WORK_DIR}/segments/a-04.mp4'
file '${WORK_DIR}/segments/a-05.mp4'
file '${WORK_DIR}/segments/a-99.mp4'
LIST
concat_segments "${WORK_DIR}/a-concat.txt" "${OUT_DIR}/angela-voice-power-preview.mp4"
make_contact_sheet "${OUT_DIR}/angela-voice-power-preview.mp4" "${OUT_DIR}/angela-voice-power-contact-sheet.jpg" "${OUT_DIR}/contact_voice_power" 2 28 73 118 163 208 232

make_title_overlay "b-00" "ANGELA ZHANG / KEEP GOING" "张韶涵" "一直往前的能量" "四首歌串成恢复力和向前感。"
render_title_segment "b-00" "4.0" "${WORK_DIR}/segments/b-00.mp4"
make_segment_overlay "b-01" "#2bb3a3" "01 / 从低处起飞" "隐形的翅膀" "励志歌不只靠口号" "真正抓人的，是脆弱和力量同时存在。" "福茂唱片 / 隐形的翅膀 Official MV"
render_overlay_segment "${ASSET_DIR}/03-wings.mp4" "b-01" "${WORK_DIR}/segments/b-01.mp4"
make_segment_overlay "b-02" "#f2c14e" "02 / 看向远处" "看得最远的地方" "把希望唱得更开阔" "情绪从自我鼓励走向更远的地方。" "福茂唱片 / 看得最远的地方 Official MV"
render_overlay_segment "${ASSET_DIR}/05-farthest-place.mp4" "b-02" "${WORK_DIR}/segments/b-02.mp4"
make_segment_overlay "b-03" "#9ccfd8" "03 / 不停下来" "淋雨一直走" "后期能量更直接" "节奏一起来，人物状态也变得坚定。" "張韶涵Angela Zhang / 淋雨一直走 Official HD MV"
render_overlay_segment "${ASSET_DIR}/06-keep-walking.mp4" "b-03" "${WORK_DIR}/segments/b-03.mp4"
make_segment_overlay "b-04" "#f7f2e8" "04 / 柔软收束" "梦里花" "把向前感落回内心" "不是一直燃，也要有一点空灵的停顿。" "福茂唱片 / 梦里花 Official MV"
render_overlay_segment "${ASSET_DIR}/04-dream-flower.mp4" "b-04" "${WORK_DIR}/segments/b-04.mp4"
make_title_overlay "b-99" "NEXT CUT" "这版适合做" "励志金曲专题" "如果继续做，可以加入舞台版和观众反应。"
render_title_segment "b-99" "5.0" "${WORK_DIR}/segments/b-99.mp4"
cat > "${WORK_DIR}/b-concat.txt" <<LIST
file '${WORK_DIR}/segments/b-00.mp4'
file '${WORK_DIR}/segments/b-01.mp4'
file '${WORK_DIR}/segments/b-02.mp4'
file '${WORK_DIR}/segments/b-03.mp4'
file '${WORK_DIR}/segments/b-04.mp4'
file '${WORK_DIR}/segments/b-99.mp4'
LIST
concat_segments "${WORK_DIR}/b-concat.txt" "${OUT_DIR}/angela-inspiration-preview.mp4"
make_contact_sheet "${OUT_DIR}/angela-inspiration-preview.mp4" "${OUT_DIR}/angela-inspiration-contact-sheet.jpg" "${OUT_DIR}/contact_inspiration" 2 28 73 118 163 187

make_title_overlay "c-00" "ANGELA ZHANG / BALLAD STORY" "张韶涵" "情歌里的遗憾感" "四首歌，听她怎么把遗憾唱得克制。"
render_title_segment "c-00" "4.0" "${WORK_DIR}/segments/c-00.mp4"
make_segment_overlay "c-01" "#f2c14e" "01 / 克制叙事" "亲爱的那不是爱情" "把遗憾放在句尾" "它不是大哭式情歌，而是慢慢意识到不对。" "福茂唱片 / 亲爱的那不是爱情 Official MV"
render_overlay_segment "${ASSET_DIR}/07-not-love.mp4" "c-01" "${WORK_DIR}/segments/c-01.mp4"
make_segment_overlay "c-02" "#f7f2e8" "02 / 遗失感" "遗失的美好" "柔软里有痛感" "不急着爆发，反而更像真的错过。" "福茂唱片 / 遗失的美好 Official MV"
render_overlay_segment "${ASSET_DIR}/08-lost-beauty.mp4" "c-02" "${WORK_DIR}/segments/c-02.mp4"
make_segment_overlay "c-03" "#e94b35" "03 / 情绪张力" "不想懂得" "越不懂，越难放下" "旋律推进时，情绪也开始失控。" "福茂唱片 / 不想懂得 Official MV"
render_overlay_segment "${ASSET_DIR}/09-dont-understand.mp4" "c-03" "${WORK_DIR}/segments/c-03.mp4"
make_segment_overlay "c-04" "#9ccfd8" "04 / 温柔收束" "手心的太阳" "伤感之后，留一点暖" "专题到这里不再只讲遗憾，也讲被照亮。" "福茂唱片 / 手心的太阳 Official MV"
render_overlay_segment "${ASSET_DIR}/10-sun-in-palm.mp4" "c-04" "${WORK_DIR}/segments/c-04.mp4"
make_title_overlay "c-99" "NEXT CUT" "这版适合做" "情歌叙事专题" "下一轮可以把字幕做成歌词感，而不是解说感。"
render_title_segment "c-99" "5.0" "${WORK_DIR}/segments/c-99.mp4"
cat > "${WORK_DIR}/c-concat.txt" <<LIST
file '${WORK_DIR}/segments/c-00.mp4'
file '${WORK_DIR}/segments/c-01.mp4'
file '${WORK_DIR}/segments/c-02.mp4'
file '${WORK_DIR}/segments/c-03.mp4'
file '${WORK_DIR}/segments/c-04.mp4'
file '${WORK_DIR}/segments/c-99.mp4'
LIST
concat_segments "${WORK_DIR}/c-concat.txt" "${OUT_DIR}/angela-ballad-preview.mp4"
make_contact_sheet "${OUT_DIR}/angela-ballad-preview.mp4" "${OUT_DIR}/angela-ballad-contact-sheet.jpg" "${OUT_DIR}/contact_ballad" 2 28 73 118 163 187

printf "%s\n" \
  "${OUT_DIR}/angela-voice-power-preview.mp4" \
  "${OUT_DIR}/angela-inspiration-preview.mp4" \
  "${OUT_DIR}/angela-ballad-preview.mp4"
