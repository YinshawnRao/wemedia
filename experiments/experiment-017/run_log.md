# Run Log: 面条从夯到拉

## Setup

User requested another “从夯到拉” video using the prior norms.

Assumptions inherited from the previous accepted video:

- 1080x1920 vertical, around 46 seconds.
- Object-by-object reveal, not tier-by-tier reveal.
- Large yellow bottom subtitles.
- Black editorial stage with grey tier table.
- Kokoro local male voice: `am_michael`, language `cmn`, speed about `1.08`.
- No external footage for this first pass.

Files:

```text
data/briefs/noodles-hang-to-la.md
data/sources/noodles-hang-to-la_sources.md
hyperframes/projects/noodles-hang-to-la/index.html
experiments/experiment-017/render_preview.py
experiments/experiment-017/narration.srt
experiments/experiment-017/kokoro-voice-map.json
```

## Build

Created a HyperFrames-style source and a local Pillow + FFmpeg preview renderer. The local renderer is used for this quick iteration because the prior workflow established it as the stable preview path when the external HyperFrames npm package is unavailable.

Generated SRT-aligned Kokoro narration:

```text
voice: am_michael
language: cmn
speed: 1.08 default
raw timeline audio: sandbox/exports/experiment-017/kokoro-narration-male.wav
project audio asset: hyperframes/projects/noodles-hang-to-la/assets/narration.wav
duration: 45.490875s
gain: +5dB
```

## Verification

```text
structure check: passed
timeline registration: present
timed clip required attributes: passed
python syntax check: passed with project pycache
visual contact sheet: generated and reviewed
video: H.264, 1080x1920, 24fps, 46.000000s
audio: AAC mono 24kHz
audio check: mean volume -26.0 dB, max volume -1.2 dB
official HyperFrames CLI lint/render: not run in this pass; local structural and export checks were used
```

Output:

```text
sandbox/exports/experiment-017/noodles-hang-to-la-preview.mp4
sandbox/exports/experiment-017/noodles-hang-to-la-contact-sheet.jpg
assets/exports/noodles-hang-to-la/noodles-hang-to-la-preview.mp4
assets/exports/noodles-hang-to-la/noodles-hang-to-la-contact-sheet.jpg
```
