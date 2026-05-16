# HyperFrames Project: 华语live翻车名场面TOP5

Experiment: `experiment-028`

This project currently uses the fast local preview path:

```text
raw clips -> ffmpeg vertical treatment -> Pillow-rendered PNG overlays -> ffmpeg concat
```

The source composition logic is kept in:

```text
experiments/experiment-028/render_top5_preview.sh
```

## Output

```text
sandbox/exports/experiment-028/mandopop-live-oops-top5-preview.mp4
sandbox/exports/experiment-028/mandopop-live-oops-top5-contact-sheet.jpg
```

Status: rendered local preview, QA checked 2026-05-16.

## Visual Rules

- Follow `/Users/yinshawnrao/explorer/wemedia/DESIGN.md`.
- Visible copy must be audience-facing only.
- Large title should only break before `TOP5`.
- This is a light live-moment roundup, not an attack video.
