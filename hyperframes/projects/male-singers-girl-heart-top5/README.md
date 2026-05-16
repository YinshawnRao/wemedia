# HyperFrames Project: 男歌手写少女心女声歌TOP5

Experiment: `experiment-026`

This project currently uses the fast local preview path:

```text
raw clips -> ffmpeg vertical treatment -> Pillow-rendered PNG overlays -> ffmpeg concat
```

The source composition logic is kept in:

```text
experiments/experiment-026/render_top5_preview.sh
```

## Output

```text
sandbox/exports/experiment-026/male-singers-girl-heart-top5-preview.mp4
sandbox/exports/experiment-026/male-singers-girl-heart-top5-contact-sheet.jpg
```

Status: rendered local preview, QA checked 2026-05-16.

## Visual Rules

- Follow `/Users/yinshawnrao/explorer/wemedia/DESIGN.md`.
- Visible copy must be audience-facing only.
- Large title should only break before `TOP5`.
- This is a contrast/catalog roundup, not a vocal-difficulty video.
