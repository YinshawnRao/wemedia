#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
INPUT_VIDEO=""
OUTPUT_VIDEO=""
TEXT=""
TEXT_FILE=""
SRT_FILE=""
WORK_DIR=""
BASENAME="voiceover"
SPEED=""

usage() {
  cat >&2 <<'USAGE'
Usage:
  scripts/tts/voiceover-video.sh --input input.mp4 --output output.mp4 --text "中文旁白"
  scripts/tts/voiceover-video.sh --input input.mp4 --output output.mp4 --srt narration.srt

Optional:
  --text-file file.txt
  --work-dir sandbox/voiceover/<experiment-id>
  --basename narration
  --speed 1.05
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --input)
      INPUT_VIDEO="$2"
      shift 2
      ;;
    --output)
      OUTPUT_VIDEO="$2"
      shift 2
      ;;
    --text)
      TEXT="$2"
      shift 2
      ;;
    --text-file)
      TEXT_FILE="$2"
      shift 2
      ;;
    --srt)
      SRT_FILE="$2"
      shift 2
      ;;
    --work-dir)
      WORK_DIR="$2"
      shift 2
      ;;
    --basename)
      BASENAME="$2"
      shift 2
      ;;
    --speed)
      SPEED="$2"
      shift 2
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [[ -z "$INPUT_VIDEO" || -z "$OUTPUT_VIDEO" ]]; then
  usage
  exit 1
fi

if [[ -z "$TEXT" && -z "$TEXT_FILE" && -z "$SRT_FILE" ]]; then
  echo "Provide one of --text, --text-file, or --srt." >&2
  exit 1
fi

if [[ -z "$WORK_DIR" ]]; then
  WORK_DIR="$ROOT_DIR/sandbox/voiceover/manual"
fi

mkdir -p "$WORK_DIR"

render_args=(--out-dir "$WORK_DIR" --basename "$BASENAME")
if [[ -n "$TEXT" ]]; then
  render_args+=(--text "$TEXT")
fi
if [[ -n "$TEXT_FILE" ]]; then
  render_args+=(--text-file "$TEXT_FILE")
fi
if [[ -n "$SRT_FILE" ]]; then
  render_args+=(--srt "$SRT_FILE")
fi
if [[ -n "$SPEED" ]]; then
  render_args+=(--speed "$SPEED")
fi

"$ROOT_DIR/scripts/tts/render-default-voiceover.sh" "${render_args[@]}" >/dev/null
"$ROOT_DIR/scripts/tts/add-voiceover.sh" "$INPUT_VIDEO" "$WORK_DIR/$BASENAME.wav" "$OUTPUT_VIDEO"
