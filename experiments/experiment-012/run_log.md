# Run Log: Experiment 012

## 2026-05-15

User asked for a direct sample video from the theme only: `川菜从夯到拉`.

Locked local-test assumptions:

- vertical 1080x1920
- 45-46 seconds
- original animated tier table
- caption-only first pass; local system voice generation returned an empty AIFF in this environment
- no downloaded source footage
- no external music

Implementation path:

1. Write brief to `data/briefs/sichuan-cuisine-hang-to-la.md`.
2. Record source/rights note to `data/sources/sichuan-cuisine-hang-to-la_sources.md`.
3. Build a HyperFrames-style HTML source under `hyperframes/projects/sichuan-cuisine-hang-to-la/`.
4. Render a local MP4 preview with a safe Pillow + FFmpeg fallback because network execution of the HyperFrames npm package was blocked.

Audio note: macOS `say` produced empty AIFF files in this environment. Kokoro was installed locally later and used for the voiced revision.

Output:

```text
sandbox/exports/experiment-012/sichuan-cuisine-hang-to-la-preview.mp4
sandbox/exports/experiment-012/sichuan-cuisine-hang-to-la-contact-sheet.jpg
assets/exports/sichuan-cuisine-hang-to-la/sichuan-cuisine-hang-to-la-preview.mp4
assets/exports/sichuan-cuisine-hang-to-la/sichuan-cuisine-hang-to-la-contact-sheet.jpg
```

Verification:

```text
structure check: passed
timeline registration: present
timed clip required attributes: passed
video: h264, 1080x1920, 24fps
duration: 46.000000s
audio: none
official HyperFrames CLI lint/render: not run; external npm execution was blocked by safety review
visual contact sheet: generated and reviewed
```

## Revision: object-by-object pacing

User pointed out the major format issue: common “从夯到拉” videos reveal one ranked object at a time, not one tier at a time.

Change made:

- revised chip timing so each dish appears as its own beat
- revised captions from tier-level lines to object-level verdicts
- revised contact sheet sampling to check each incremental reveal

Re-rendered output:

```text
video: h264, 1080x1920, 24fps
duration: 46.000000s
audio: none
export: assets/exports/sichuan-cuisine-hang-to-la/sichuan-cuisine-hang-to-la-preview.mp4
contact sheet: assets/exports/sichuan-cuisine-hang-to-la/sichuan-cuisine-hang-to-la-contact-sheet.jpg
```

## Revision: Kokoro voiceover

Added local Kokoro narration without API keys:

- generated SRT-aligned voiceover from `experiments/experiment-012/narration.srt`
- voice map: `experiments/experiment-012/kokoro-voice-map.json`
- voice: `zf_xiaobei`, language: `cmn`
- timeline audio: `sandbox/exports/experiment-012/kokoro-narration-timeline.wav`
- project audio asset: `hyperframes/projects/sichuan-cuisine-hang-to-la/assets/narration.wav`
- final export copied to `assets/exports/sichuan-cuisine-hang-to-la/sichuan-cuisine-hang-to-la-preview.mp4`
- final video stream: 1080x1920, 24fps, 46.000000s
- final audio stream: AAC mono 24kHz, 45.480000s
- audio check after +3dB gain: mean volume -23.2 dB, max volume -1.6 dB

## Revision: switch to more standard Mandarin voice

User noted the previous voice sounded strange. Switched Kokoro voice from `zf_xiaobei` to `zf_xiaoxiao`, with slightly calmer speeds:

```text
default speed: 1.08
segment 1 speed: 1.02
segment 10 speed: 1.12
segment 11 speed: 1.0
```

Re-rendered output:

```text
export: assets/exports/sichuan-cuisine-hang-to-la/sichuan-cuisine-hang-to-la-preview.mp4
video: 1080x1920, 24fps, 46.000000s
audio: AAC mono 24kHz, 45.476000s
audio check after +3dB gain: mean volume -19.6 dB, max volume -0.5 dB
```

## Revision: male broadcaster-style voice trial

User asked for a male voice closer to a broadcast host. Kokoro's native Mandarin voice set in this local install is mostly female, so this trial uses a steadier male voice with Mandarin language mode:

- voice map: `experiments/experiment-012/kokoro-voice-map-male.json`
- voice: `am_michael`, language: `cmn`
- SRT-aligned audio: `sandbox/exports/experiment-012/kokoro-narration-male-michael.wav`
- project audio asset: `hyperframes/projects/sichuan-cuisine-hang-to-la/assets/narration.wav`
- final export copied to `assets/exports/sichuan-cuisine-hang-to-la/sichuan-cuisine-hang-to-la-preview.mp4`

Verification:

```text
video: H.264, 1080x1920, 24fps, 46.000000s
audio: AAC mono 24kHz
audio check after +3dB gain: mean volume -27.6 dB, max volume -1.4 dB
```
