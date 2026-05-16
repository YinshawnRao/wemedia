#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 3 ]]; then
  echo "Usage: scripts/tts/add-voiceover.sh <input.mp4> <voiceover.wav> <output.mp4>" >&2
  exit 1
fi

INPUT_VIDEO="$1"
VOICEOVER="$2"
OUTPUT_VIDEO="$3"

if [[ ! -f "$INPUT_VIDEO" ]]; then
  echo "Input video not found: $INPUT_VIDEO" >&2
  exit 1
fi

if [[ ! -f "$VOICEOVER" ]]; then
  echo "Voiceover audio not found: $VOICEOVER" >&2
  exit 1
fi

mkdir -p "$(dirname "$OUTPUT_VIDEO")"

HAS_AUDIO="$(ffprobe -v error -select_streams a:0 -show_entries stream=index -of csv=p=0 "$INPUT_VIDEO" | head -n 1 || true)"

if [[ -n "$HAS_AUDIO" ]]; then
  ffmpeg -v error -y -i "$INPUT_VIDEO" -i "$VOICEOVER" \
    -filter_complex "[0:a]aformat=sample_fmts=fltp:sample_rates=48000:channel_layouts=stereo,volume=0.50[bed];[1:a]aformat=sample_fmts=fltp:sample_rates=48000:channel_layouts=stereo,volume=1.18,asplit=2[voice_mix][voice_side];[voice_side]apad[voice_side_pad];[bed][voice_side_pad]sidechaincompress=threshold=0.035:ratio=8:attack=18:release=320[ducked];[ducked][voice_mix]amix=inputs=2:duration=first:normalize=0,loudnorm=I=-16:TP=-1.5:LRA=11[a]" \
    -map 0:v:0 -map "[a]" -c:v copy -c:a aac -b:a 192k -ar 48000 -ac 2 -movflags +faststart "$OUTPUT_VIDEO"
else
  ffmpeg -v error -y -i "$INPUT_VIDEO" -i "$VOICEOVER" \
    -filter_complex "[1:a]aformat=sample_fmts=fltp:sample_rates=48000:channel_layouts=stereo,loudnorm=I=-16:TP=-1.5:LRA=11[a]" \
    -map 0:v:0 -map "[a]" -c:v copy -c:a aac -b:a 192k -ar 48000 -ac 2 -movflags +faststart "$OUTPUT_VIDEO"
fi

printf "%s\n" "$OUTPUT_VIDEO"
