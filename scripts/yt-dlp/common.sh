#!/usr/bin/env bash
set -euo pipefail

YTDLP_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${YTDLP_SCRIPT_DIR}/../.." && pwd)"

YTDLP_BIN="${YTDLP_BIN:-yt-dlp}"
COOKIES_BROWSER="${YTDLP_COOKIES_BROWSER:-chrome}"
COOKIES_FILE="${YTDLP_COOKIES_FILE:-}"
JS_RUNTIME="${YTDLP_JS_RUNTIME:-node}"
FORMAT_SELECTOR="${YTDLP_FORMAT:-bv*+ba/b}"
SUB_LANGS="${YTDLP_SUB_LANGS:-en,zh-Hans,zh-Hant}"
OUTPUT_MODE="${WEMEDIA_OUTPUT_MODE:-production}"

case "$OUTPUT_MODE" in
  production)
    YTDLP_OUTPUT_ROOT="$ROOT_DIR"
    ;;
  test|sandbox)
    YTDLP_OUTPUT_ROOT="${ROOT_DIR}/sandbox/yt-dlp"
    ;;
  *)
    echo "Error: WEMEDIA_OUTPUT_MODE must be production, test, or sandbox." >&2
    exit 1
    ;;
esac

DOWNLOADS_DIR="${YTDLP_OUTPUT_ROOT}/downloads"
CLIPS_DIR="${YTDLP_OUTPUT_ROOT}/clips"
AUDIO_DIR="${YTDLP_OUTPUT_ROOT}/audio"
SUBTITLES_DIR="${YTDLP_OUTPUT_ROOT}/subtitles"
LOGS_DIR="${YTDLP_OUTPUT_ROOT}/logs"

DOWNLOAD_ARCHIVE="${LOGS_DIR}/downloads-archive.txt"
AUDIO_ARCHIVE="${LOGS_DIR}/audio-archive.txt"
SUBTITLE_ARCHIVE="${LOGS_DIR}/subtitles-archive.txt"
RUN_LOG="${LOGS_DIR}/yt-dlp-runs.tsv"
CLIP_LOG="${LOGS_DIR}/clip-runs.tsv"

BASE_ARGS=(--js-runtimes "$JS_RUNTIME" --no-playlist --restrict-filenames)
if [[ -n "$COOKIES_FILE" ]]; then
  BASE_ARGS=(--cookies "$COOKIES_FILE" "${BASE_ARGS[@]}")
elif [[ "$COOKIES_BROWSER" != "none" ]]; then
  BASE_ARGS=(--cookies-from-browser "$COOKIES_BROWSER" "${BASE_ARGS[@]}")
fi

VIDEO_ARGS=(-f "$FORMAT_SELECTOR" --merge-output-format mp4)
METADATA_ARGS=(
  --write-info-json
  --write-thumbnail
  --write-description
  --write-subs
  --write-auto-subs
  --sub-langs "$SUB_LANGS"
  --convert-subs srt
)

die() {
  echo "Error: $*" >&2
  exit 1
}

safe_slug() {
  local value="${1:-_inbox}"
  value="${value// /-}"
  value="${value//\//-}"
  value="${value//:/-}"
  echo "$value"
}

safe_time() {
  local value="$1"
  value="${value//:/-}"
  value="${value//./-}"
  echo "$value"
}

init_dirs() {
  mkdir -p "$DOWNLOADS_DIR" "$CLIPS_DIR" "$AUDIO_DIR" "$SUBTITLES_DIR" "$LOGS_DIR"
}

ensure_tools() {
  command -v "$YTDLP_BIN" >/dev/null 2>&1 || die "yt-dlp is not available in PATH"
  command -v ffmpeg >/dev/null 2>&1 || die "ffmpeg is not available in PATH"
  command -v "$JS_RUNTIME" >/dev/null 2>&1 || die "$JS_RUNTIME is not available in PATH"
  if [[ -n "$COOKIES_FILE" && ! -f "$COOKIES_FILE" ]]; then
    die "cookies file does not exist: $COOKIES_FILE"
  fi
}

log_run() {
  local action="$1"
  local status="$2"
  local target="$3"
  local url="$4"

  init_dirs
  if [[ ! -f "$RUN_LOG" ]]; then
    printf "timestamp\taction\tstatus\ttarget\turl\n" >> "$RUN_LOG"
  fi

  printf "%s\t%s\t%s\t%s\t%s\n" "$(date -u +"%Y-%m-%dT%H:%M:%SZ")" "$action" "$status" "$target" "$url" >> "$RUN_LOG"
}

run_ytdlp() {
  local action="$1"
  local target="$2"
  local url="$3"
  shift 3

  set +e
  "$YTDLP_BIN" "$@"
  local status=$?
  set -e

  if [[ $status -eq 0 ]]; then
    log_run "$action" "ok" "$target" "$url"
  else
    log_run "$action" "failed:${status}" "$target" "$url"
  fi

  return $status
}
