# Experiment 010 Run Log

## 2026-05-13

Goal: 制作一个本地实验版张惠妹歌曲演唱难度 TOP5 盘点视频，每段取高音/高难度片段，并叠加专业音乐科普备注。

## Setup

- Output mode: `test`
- Raw clips: `sandbox/yt-dlp/clips/experiment-010/`
- Preview assets: `sandbox/hyperframes/experiment-010/assets/`
- Exports: `sandbox/exports/experiment-010/`
- Brief: `data/briefs/amei-vocal-difficulty-top5.md`
- Source log: `data/sources/experiment-010_sources.md`
- Future HyperFrames project: `hyperframes/projects/amei-vocal-difficulty-top5/`
- Download runtime: `yt-dlp --cookies-from-browser chrome --js-runtimes node`
- Test format cap: `bv*[height<=1080]+ba/b[height<=1080]/b`

## Download Result

All five clips downloaded successfully:

- `NFHb0OwmE-0` / 三天三夜 / 00:03:13-00:03:53
- `1dyRJJzlwQ8` / 掉了 / 00:02:43-00:03:23
- `mLk61pfiHQ0` / 听海 / 00:03:48-00:04:28
- `ZH9k3643BH8` / 剪爱 / 00:03:12-00:03:52
- `YloYq5cZRig` / 也许明天 / 00:03:21-00:04:01

Note: the 1080p cap worked well for preview speed. Two ForwardMusic restored sources still downloaded as 1600x1080, but the clips stayed manageable compared with uncapped 4K tests.

## Render Result

Rendered with `experiments/experiment-010/render_top5_preview.sh`.

Output files:

- `sandbox/exports/experiment-010/amei-top5-vocal-difficulty-preview.mp4`
- `sandbox/exports/experiment-010/amei-top5-vocal-difficulty-contact-sheet.jpg`

Technical check:

- Duration: 210.054 seconds
- Video: H.264, 1080x1920, 30fps
- Audio: AAC stereo, 48000 Hz
- Volume: mean `-19.0 dB`, max `-1.0 dB`

## Notes For Next Review

- The current order emphasizes sustained intensity, belting stability, vocal weight, and endurance.
- Pitch labels are phrased as `参考峰值` because the project does not yet have a robust pitch-detection or score-verification workflow.
- The contact sheet confirms each rank card renders on screen without visible cropping.
- Next refinement should focus on whether `也许明天` is the best TOP5 closer, or whether `人质` / `哭不出来` / `如果你也听说` should replace it.
