# Run Log: Experiment 013

Date: 2026-05-15

## Goal

制作一条本地实验版《陶喆难度最高的5首歌》：用户提供排名和难点描述，成片按 Top5 -> Top1 揭晓，每首取最高音或最高难度段落，保留原曲声音。

## Source Collection

优先选择官方或可信频道：

- Top5 `望春风`: Timeless Music Official MV
- Top4 `心乱飞`: 陶喆 David Tao Official audio
- Top3 `飞机场的10:30`: Timeless Music Official MV
- Top2 `爱是个什么东西`: Timeless Music Official MV
- Top1 `不爱`: 陶喆 David Tao Official audio, YouTube metadata title `Forever`

Detailed source records are in `data/sources/experiment-013_sources.md`.

## Download

Used the existing yt-dlp workflow with Chrome cookies and Node runtime. Output mode stayed in sandbox/testing paths:

```text
sandbox/yt-dlp/clips/experiment-013/
```

The experiment download script is:

```text
experiments/experiment-013/download_clips.sh
```

## Render

Created and ran:

```text
experiments/experiment-013/render_top5_preview.sh
```

The preview route is Chrome-rendered SVG overlays plus ffmpeg processing/concat. This keeps the turn fast while preserving the HyperFrames visual direction from `DESIGN.md`.

## Output

```text
sandbox/exports/experiment-013/david-tao-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-013/david-tao-top5-vocal-difficulty-contact-sheet.jpg
```

## Checks

- ffprobe: 1080x1920, H.264, AAC stereo, duration 274.388s.
- volumedetect: mean -19.2 dB, max 0.0 dB.
- Contact sheet: order and title logic are correct; visible title does not mention `倒序` or `倒数`.

## Notes For Next Pass

- If publishing-quality accuracy is needed, add a pitch verification step before writing exact notes such as `High C`.
- If the user wants a tighter short-video version, reduce each song to 18-25s while preserving the most recognizable high-difficulty phrase.
- If the user approves the cut points, migrate the same timings into a fuller HyperFrames composition for animated text and transitions.
