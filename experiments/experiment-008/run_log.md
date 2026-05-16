# Experiment 008 Run Log

## 2026-05-13

Goal: 制作一个本地实验版张韶涵歌曲演唱难度 TOP5 盘点视频，每段取高音/高难度片段，并叠加专业音乐科普备注。

## Setup

- Output mode: `test`
- Raw clips: `sandbox/yt-dlp/clips/experiment-008/`
- Preview assets: `sandbox/hyperframes/experiment-008/assets/`
- Exports: `sandbox/exports/experiment-008/`
- Brief: `data/briefs/angela-vocal-difficulty-top5.md`
- Source log: `data/sources/experiment-008_sources.md`
- Future HyperFrames project: `hyperframes/projects/angela-vocal-difficulty-top5/`
- Download runtime: `yt-dlp --cookies-from-browser chrome --js-runtimes node`

## Download Result

YouTube cookies failed earlier on 2026-05-13 because the browser session needed re-login. After Chrome login was refreshed, all five clips downloaded successfully:

- `Oq3dVBEdc4M` / 阿刁 / 00:03:55-00:04:35
- `zXHqzoroAj4` / 不痛 / 00:02:54-00:03:34
- `UU4p0eb0IBQ` / 呐喊 / 00:02:55-00:03:35
- `-4eJy_cpvoo` / 寓言 / 00:02:46-00:03:26
- `dmwJaG-R1iM` / 欧若拉 / 00:02:45-00:03:25

## Render Result

Rendered with `experiments/experiment-008/render_top5_preview.sh`.

Output files:

- `sandbox/exports/experiment-008/angela-top5-vocal-difficulty-preview.mp4`
- `sandbox/exports/experiment-008/angela-top5-vocal-difficulty-contact-sheet.jpg`

Technical check:

- Duration: 210.087 seconds
- Video: H.264, 1080x1920, 30fps
- Audio: AAC stereo, 48000 Hz
- Volume: mean `-19.8 dB`, max `-2.6 dB`

## Notes For Next Review

- The current order is based on local editorial judgment, not a definitive vocal pedagogy ranking.
- Pitch labels are intentionally phrased as `参考峰值` because the project does not yet have a robust pitch-detection or score-verification workflow.
- The contact sheet confirms each rank card renders on screen without visible cropping.
- Next refinement should focus on whether each selected 40-second clip captures the actual highest or most dramatic phrase.
