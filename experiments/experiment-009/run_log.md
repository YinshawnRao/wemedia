# Experiment 009 Run Log

## 2026-05-13

Goal: 制作一个本地实验版杨丞琳歌曲演唱难度 TOP5 盘点视频，每段取高音/高难度片段，并叠加专业音乐科普备注。

## Setup

- Output mode: `test`
- Raw clips: `sandbox/yt-dlp/clips/experiment-009/`
- Preview assets: `sandbox/hyperframes/experiment-009/assets/`
- Exports: `sandbox/exports/experiment-009/`
- Brief: `data/briefs/rainie-vocal-difficulty-top5.md`
- Source log: `data/sources/experiment-009_sources.md`
- Future HyperFrames project: `hyperframes/projects/rainie-vocal-difficulty-top5/`
- Download runtime: `yt-dlp --cookies-from-browser chrome --js-runtimes node`

## Download Result

All five clips downloaded successfully:

- `anurOHpo0aY` / 年轮说 / 00:03:04-00:03:44
- `KOLDiXnQC7Q` / 带我走 / 00:03:28-00:04:08
- `oec9R5ypf-o` / 雨爱 / 00:03:18-00:03:58
- `s9hGDIpwfXw` / 匿名的好友 / 00:02:54-00:03:34
- `mebzXfWi87E` / 暧昧 / 00:03:15-00:03:55

Note: `暧昧` was selected from a high-resolution source, so download-side transcoding was slower and the raw clip was larger than the other four.

## Render Result

Rendered with `experiments/experiment-009/render_top5_preview.sh`.

Output files:

- `sandbox/exports/experiment-009/rainie-top5-vocal-difficulty-preview.mp4`
- `sandbox/exports/experiment-009/rainie-top5-vocal-difficulty-contact-sheet.jpg`

Technical check:

- Duration: 210.121 seconds
- Video: H.264, 1080x1920, 30fps
- Audio: AAC stereo, 48000 Hz
- Volume: mean `-18.6 dB`, max `-4.1 dB`

## Notes For Next Review

- The current order emphasizes stable upper-middle register, phrasing, breath control, and emotional color rather than extreme high notes.
- Pitch labels are phrased as `参考峰值` because the project does not yet have a robust pitch-detection or score-verification workflow.
- The contact sheet confirms each rank card renders on screen without visible cropping.
- Next refinement should focus on whether `暧昧` belongs in a difficulty TOP5, or whether a later pass should swap it with `青春住了谁` / `仰望` / `点水`.
