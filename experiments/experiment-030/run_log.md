# Run Log: Experiment 030

Date: 2026-05-16

## Goal

Create a local preview for “王菲最难的5首歌”, using the user-provided ranking but revealing in reverse order from Top5 to Top1.

## Steps

1. Confirmed project rules, visual direction, and reusable TOP5 renderer.
2. Searched YouTube candidates with yt-dlp using Chrome cookies and Node runtime.
3. Recorded selected sources in `data/sources/experiment-030_sources.md`.
4. Wrote editing brief in `data/briefs/faye-wong-top5-vocal-difficulty.md`.
5. Downloaded five 34-second test clips to `sandbox/yt-dlp/clips/experiment-030/`.
6. Rendered vertical preview using `scripts/video/pillow_top5_renderer.py`.
7. Checked contact sheet, stream parameters, duration, and audio loudness.

## Output

```text
sandbox/exports/experiment-030/faye-wong-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-030/faye-wong-top5-vocal-difficulty-contact-sheet.jpg
```

## QA

```text
1080x1920, 30fps, H.264 video
AAC stereo, 48 kHz audio
Duration: 180.521333s
Audio loudness check: mean -18.8 dB, max -1.2 dB
Contact sheet checked: intro, Top5 -> Top1, closing all present
```

## Notes

- Four of the five selected clips use official FayeWongVEVO or Faye Wong Official Channel sources.
- `半途而废` uses official-channel audio/visual rather than a fan-uploaded live source to preserve source reliability.
- Older official MV sources have lower image resolution, but the source audio is usable and the vertical wrapper keeps the edit readable.
- For Wang Fei difficulty videos, visible copy should stress lightness, airy tone, register edge, odd phrasing, and restraint rather than only high notes.

