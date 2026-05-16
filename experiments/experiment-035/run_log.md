# Run Log: 蔡依林最难的歌 TOP5

## Setup

User requested a local TOP5 music difficulty demo:

```text
蔡依林最难的5首歌
1. 舞娘
2. Play 我呸
3. 怪美的
4. 倒带
5. 特务J
```

Applied project defaults:

- Read `AGENTS.md`, `memory/video-production-contract.md`, `memory/project-state.md`, `memory/learnings.md`, and `DESIGN.md`.
- Use new experiment ID `experiment-035`.
- Keep test clips and exports in `sandbox/`.
- Reveal order is Top 5 -> Top 1.
- Use source audio for song segments.
- Add a short intro voiceover that reads only the main title.
- Visible copy must not include internal workflow or prompt-related wording.

## Plan

- Use official MV sources where available.
- Use official audio/Topic-style source for `倒带` if an official original MV is not clearly available.
- Download only short planned sections for this local preview.
- Render with the stable Pillow + ffmpeg TOP5 preview path.

## Download Result

Downloaded 5 planned clips to:

```text
sandbox/yt-dlp/clips/experiment-035/
```

Clip notes:

- Top 5 `特务J`: Warner official MV, moving source.
- Top 4 `倒带`: JOLIN official-channel audio source titled `Hai Dao`; first-pass sound-first choice, visually static/low-motion.
- Top 3 `怪美的`: official MV, moving source.
- Top 2 `Play 我呸`: Warner official HD MV, moving source.
- Top 1 `舞娘`: Warner official MV, moving source.

## Render Result

Rendered base preview, mixed intro-only title voiceover, and regenerated the contact sheet using fixed timestamps:

```text
sandbox/exports/experiment-035/jolin-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-035/jolin-top5-vocal-difficulty-contact-sheet.jpg
sandbox/voiceover/experiment-035/jolin-title.wav
```

## QA

- Structure check passed: intro, Top5 through Top1, closing.
- Reveal order passed: `特务J -> 倒带 -> 怪美的 -> Play 我呸 -> 舞娘`.
- Export check passed: 1080x1920, H.264 video, AAC stereo audio, about 180.53 seconds.
- Audio check passed: AAC stereo present; volumedetect mean about -18.0 dB, max about -0.4 dB.
- Voiceover check passed: intro title voiceover generated with `zm_yunxi`, duration about 2.875 seconds.
- Contact sheet check passed after timestamp-based regeneration: intro, all five song segments, and closing are visible.
- Visible copy check passed: rendered script contains no internal workflow or prompt-related wording.

## Voiceover Fix

Issue found after user review:

- Original TTS input was `蔡依林最难的歌，TOP5。`.
- Kokoro Chinese parsing treated `TOP5` unstably and effectively dropped the `5`, producing a strange tail sound.

Fix:

- Regenerated intro voiceover as `蔡依林最难的歌，前五名。`.
- Re-mixed the final preview from the clean base render.
- Kept the visual title as `蔡依林最难的歌 / TOP5`.
- Moved intermediate base render and contact-frame files out of `sandbox/exports/experiment-035/`.

Post-fix QA:

- Final preview remains 1080x1920, H.264, AAC stereo, about 180.53 seconds.
- Updated intro voiceover duration is about 3.25 seconds.
- Export directory now contains only the final preview MP4 and final contact sheet.
