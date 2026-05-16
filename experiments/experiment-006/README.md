# Experiment 006: 张韶涵单歌手专题

方向：从横向女歌手盘点转为单个女歌手专题，测试“人物弧线 + 代表作章节”是否比名单式盘点更有记忆点。

## Working Title

张韶涵：清亮、穿透、一直往前

## Goal

- 做 9:16 本地实验样片。
- 不使用付费 TTS，不加生硬旁白。
- 每首保留约 26 秒原始音乐音频，让副歌或 hook 能真正落地。
- 验证单歌手专题是否可以继续拆成现场版、高音版、励志金曲版、情歌叙事版。

## Chapters

| # | Song | Role |
|---|---|---|
| 1 | 欧若拉 | 早期辨识度 |
| 2 | 隐形的翅膀 | 穿透型高音 |
| 3 | 亲爱的那不是爱情 | 情歌叙事 |
| 4 | 遗失的美好 | 遗憾感 |
| 5 | 淋雨一直走 | 后期能量 |

## Output

- Preview video: `sandbox/exports/experiment-006/angela-zhang-special-preview.mp4`
- Contact sheet: `sandbox/exports/experiment-006/angela-zhang-special-contact-sheet.jpg`
- HyperFrames source: `sandbox/hyperframes/experiment-006/index.html`
- Fast preview script: `experiments/experiment-006/render_ffmpeg_preview.sh`

## Verification

- HyperFrames lint: 0 errors, 0 warnings
- HyperFrames inspect: 0 layout issues across 12 timeline samples
- Export: 1080x1920, H.264, 30 fps, AAC stereo 48000 Hz
- Duration: 139.521333 seconds
- Audio loudness check: mean `-18.5 dB`, max `-2.3 dB`

## Notes

This is local sandbox experimentation only. It is not a commercial publishing package and still needs rights review before any public use.
