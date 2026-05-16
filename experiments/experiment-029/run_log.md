# Run Log: Experiment 029

Date: 2026-05-16

## Goal

Create a local preview for “陈奕迅最难的5首歌”, using the user-provided ranking but revealing in reverse order from Top5 to Top1.

## Steps

1. Confirmed project rules, visual direction, and reusable TOP5 renderer.
2. Searched YouTube candidates with yt-dlp using Chrome cookies and Node runtime.
3. Recorded selected sources in `data/sources/experiment-029_sources.md`.
4. Wrote editing brief in `data/briefs/eason-top5-vocal-difficulty.md`.
5. Downloaded five 34-second test clips to `sandbox/yt-dlp/clips/experiment-029/`.
6. Rendered vertical preview using `scripts/video/pillow_top5_renderer.py`.
7. Checked contact sheet, stream parameters, duration, and audio loudness.

## Output

```text
sandbox/exports/experiment-029/eason-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-029/eason-top5-vocal-difficulty-contact-sheet.jpg
```

## QA

```text
1080x1920, 30fps, H.264 video
AAC stereo, 48 kHz audio
Duration: 180.521333s
Audio loudness check: mean -18.8 dB, max -1.5 dB
Contact sheet checked: intro, Top5 -> Top1, closing all present
```

## Notes

- Three of the five selected clips come from the Eason Chan official channel.
- `反高潮` and `时代巨轮` used non-official live uploads due to more suitable live/demo availability and are marked `rights_review`.
- The visible text focuses on vocal difficulty and avoids internal workflow language.
- For Eason vocal-difficulty videos, the copy should emphasize control, phrasing, emotional tension, and stamina, not only high notes.

