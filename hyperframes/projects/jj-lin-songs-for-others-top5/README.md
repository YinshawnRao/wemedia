# HyperFrames Project: 林俊杰为别人创作的歌TOP5

Experiment: `experiment-024`

This project currently uses the fast local preview path:

```text
raw clips -> ffmpeg vertical treatment -> Pillow-rendered PNG overlays -> ffmpeg concat
```

The source composition logic is kept in:

```text
experiments/experiment-024/render_top5_preview.sh
```

## Output

```text
sandbox/exports/experiment-024/jj-lin-songs-for-others-top5-preview.mp4
sandbox/exports/experiment-024/jj-lin-songs-for-others-top5-contact-sheet.jpg
```

## Status

- Rendered preview: complete.
- Export check: `1080x1920`, H.264, 30 fps, AAC stereo 48 kHz, `00:05:02`.
- Contact sheet: complete.

## Visual Rules

- Follow `/Users/yinshawnrao/explorer/wemedia/DESIGN.md`.
- Visible copy must be audience-facing only.
- This is a creator/catalog roundup, not a vocal-difficulty video.
