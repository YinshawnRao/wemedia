# Run Log: 川菜从夯到拉

## Setup

User requested a local “从夯到拉” demo with narration:

```text
主题：川菜
台词：Codex writes it, light roast, no personal attacks.
```

Project constraints applied:

- Read `AGENTS.md`, `memory/video-production-contract.md`, `memory/project-state.md`, `memory/learnings.md`, and `DESIGN.md`.
- Use new experiment ID `experiment-034`.
- Keep demo outputs in `sandbox/`.
- Use current project default TTS voice `zm_yunxi`.
- Do not use deprecated old Kokoro ONNX runtime or old voice-map files.
- Use object-by-object reveal.
- Use no external media for this first pass.

Files:

```text
data/briefs/sichuan-cuisine-hang-to-la-v2.md
data/sources/experiment-034_sources.md
experiments/experiment-034/narration.srt
experiments/experiment-034/render_preview.py
hyperframes/projects/sichuan-cuisine-hang-to-la-v2/index.html
```

## Build

Generated SRT-aligned narration with the current project default local voice:

```text
voice: zm_yunxi
profile: default_kokoro_yunxi
raw voiceover: sandbox/voiceover/experiment-034/narration.wav
normalized project asset: hyperframes/projects/sichuan-cuisine-hang-to-la-v2/assets/narration.wav
raw duration: 53.650000s
```

`zm_yunxi` has a slower, more natural delivery than the older deprecated test voice, so the final timeline was extended from the initial 46-second draft to 56 seconds. This keeps object reveals aligned with speech instead of compressing the narration.

Rendered with the local Pillow + FFmpeg preview path:

```text
preview: sandbox/exports/experiment-034/sichuan-cuisine-hang-to-la-v2-preview.mp4
contact sheet: sandbox/exports/experiment-034/sichuan-cuisine-hang-to-la-v2-contact-sheet.jpg
```

## Verification

```text
python syntax check: passed
structure check: passed
timeline registration: present
timed clip required attributes: passed
visible internal-token scan: passed
visual contact sheet: generated and reviewed
video: H.264, 1080x1920, 30fps, 56.000000s
audio: AAC stereo 48kHz
audio check: mean volume -21.6 dB, max volume -4.4 dB
external media: none
official HyperFrames CLI lint/render: not run in this pass; local structural and export checks were used
```
