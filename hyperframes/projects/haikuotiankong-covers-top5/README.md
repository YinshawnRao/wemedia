# HyperFrames Project: 《海阔天空》神级翻唱TOP5

Experiment: `experiment-027`

This project currently uses the fast local preview path:

```text
raw clips -> ffmpeg vertical treatment -> Pillow-rendered PNG overlays -> ffmpeg concat
```

The source composition logic is kept in:

```text
experiments/experiment-027/render_top5_preview.sh
```

## Output

```text
sandbox/exports/experiment-027/haikuotiankong-covers-top5-preview.mp4
sandbox/exports/experiment-027/haikuotiankong-covers-top5-contact-sheet.jpg
```

Status: rendered local preview, QA checked 2026-05-16.

## Visual Rules

- Follow `/Users/yinshawnrao/explorer/wemedia/DESIGN.md`.
- Visible copy must be audience-facing only.
- Large title should only break before `TOP5`.
- This is a classic-cover comparison, not an argument about replacing or surpassing the original.
