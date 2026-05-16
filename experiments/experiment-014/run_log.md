# Run Log: Experiment 014

Date: 2026-05-15

## Goal

制作一条本地实验版《王力宏难度最高的5首歌》：用户提供排名和难点描述，成片按 Top5 -> Top1 揭晓，每首取最高音或最高难度段落，保留原曲声音。

## Source Collection

优先选择王力宏官方频道：

- Top5 `脚本`: 王力宏 Wang Leehom Official live video
- Top4 `天地龙鳞`: 王力宏 Wang Leehom Official MV
- Top3 `爱错`: 王力宏 Wang Leehom Official video
- Top2 `就是现在`: 王力宏 Wang Leehom Official MV
- Top1 `缘分一道桥`: 王力宏 Wang Leehom Official MV

Detailed source records are in `data/sources/experiment-014_sources.md`.

## Download

Used the existing yt-dlp workflow with Chrome cookies and Node runtime. Output mode stayed in sandbox/testing paths:

```text
sandbox/yt-dlp/clips/experiment-014/
```

The experiment download script is:

```text
experiments/experiment-014/download_clips.sh
```

## Render

Created and ran:

```text
experiments/experiment-014/render_top5_preview.sh
```

The preview route is Chrome-rendered SVG overlays plus ffmpeg processing/concat. This keeps the turn fast while preserving the HyperFrames visual direction from `DESIGN.md`.

## Output

```text
sandbox/exports/experiment-014/leehom-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-014/leehom-top5-vocal-difficulty-contact-sheet.jpg
```

## Checks

- ffprobe: 1080x1920, H.264, AAC stereo, duration 311.521s.
- volumedetect: mean -17.9 dB, max -1.3 dB.
- Contact sheet: order and title logic are correct; visible title does not mention `倒序` or `倒数`.

## Notes For Next Pass

- `脚本` currently uses official live footage; if the user wants original studio vocal texture, compare with the official karaoke/video source before finalizing.
- `缘分一道桥` is intentionally the longest segment to preserve the dense final-chorus high-note stack.
- If publishing-quality accuracy is needed, add a pitch verification step before treating E5/C5/D5/C#5/D#5 as confirmed score facts.
