#!/usr/bin/env bash
set -uo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
export WEMEDIA_OUTPUT_MODE=test
export YTDLP_FORMAT="${YTDLP_FORMAT:-bv*[height<=1080]+ba/b[height<=1080]/b}"

failures=0

download_clip() {
  local label="$1"
  local url="$2"
  local start="$3"
  local end="$4"

  printf "\n==> %s %s-%s\n" "$label" "$start" "$end"
  if ! "${ROOT_DIR}/scripts/yt-dlp/download-clip.sh" "$url" "experiment-031" "$start" "$end"; then
    printf "Download failed: %s\n" "$label" >&2
    failures=$((failures + 1))
  fi
}

download_clip_no_subs() {
  local label="$1"
  local url="$2"
  local start="$3"
  local end="$4"
  local safe_start="${start//:/-}"
  local safe_end="${end//:/-}"
  local out_dir="${ROOT_DIR}/sandbox/yt-dlp/clips/experiment-031"

  mkdir -p "$out_dir"
  printf "\n==> %s %s-%s (no subtitles)\n" "$label" "$start" "$end"
  if ! yt-dlp \
    --cookies-from-browser chrome \
    --js-runtimes node \
    --no-playlist \
    --restrict-filenames \
    -f "$YTDLP_FORMAT" \
    --merge-output-format mp4 \
    --write-info-json \
    --write-thumbnail \
    --write-description \
    --no-write-subs \
    --no-write-auto-subs \
    --download-sections "*${start}-${end}" \
    --force-keyframes-at-cuts \
    -o "${out_dir}/%(upload_date)s_%(uploader)s_%(title)s_%(id)s_clip_${safe_start}_${safe_end}.%(ext)s" \
    "$url"; then
    printf "Download failed: %s\n" "$label" >&2
    failures=$((failures + 1))
  fi
}

download_clip "Top5 也许明天" "https://www.youtube.com/watch?v=YloYq5cZRig" "00:03:34" "00:04:08"
download_clip "Top4 如果你也听说" "https://www.youtube.com/watch?v=xrUyk79DLbg" "00:03:18" "00:03:52"
download_clip "Top3 血腥爱情故事" "https://www.youtube.com/watch?v=5O7hdU7ptmY" "00:03:04" "00:03:38"
download_clip "Top2 这样你还要爱我吗" "https://www.youtube.com/watch?v=cFvLq3rPeTk" "00:04:24" "00:04:58"
download_clip_no_subs "Top1 彩虹" "https://www.youtube.com/watch?v=OvlWgjiQYpo" "00:02:35" "00:03:09"

if [[ "$failures" -gt 0 ]]; then
  printf "\n%s clip download(s) failed.\n" "$failures" >&2
  exit 1
fi

printf "\nAll experiment-031 clips downloaded.\n"
