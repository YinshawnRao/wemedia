# Brief: 周杰伦最难的5首歌

Experiment: `experiment-019`

## Goal

制作一条竖屏音乐盘点 demo，标题为 `周杰伦最难的5首歌`。用户提供正序排名，成片倒序揭晓，从 Top5 到 Top1。每段取歌曲最难的高位、持续副歌、真假声或情绪控制段，保留原曲声音。

## Audience

面向喜欢华语流行、唱歌难度分析、KTV挑战和短视频音乐盘点的观众。文字要像音乐科普短视频，不出现任何项目约束、提示词、素材下载流程或内部目录信息。

## Structure

| Order | Visible Rank | Song | Visible Difficulty Label | Clip |
|---|---|---|---|---|
| 1 | Top 5 | 黑色幽默 | 真假声转换 | 00:02:56-00:04:08 |
| 2 | Top 4 | 一路向北 | 压抑高音 | 00:03:26-00:04:36 |
| 3 | Top 3 | 枫 | 升Key耐力 | 00:03:16-00:04:26 |
| 4 | Top 2 | 搁浅 | 持续高音 | 00:02:52-00:04:02 |
| 5 | Top 1 | 白色风车 | 温柔高音 | 00:03:18-00:04:34 |

## Visual Direction

- 9:16 vertical, 1080x1920.
- Use `DESIGN.md` palette: dark graphite background, warm cream text, red/teal/gold accents.
- Keep original MV centered with blurred background fill.
- Text overlay should be compact: rank, song title, difficulty label, two short music-analysis lines, source label.
- No TTS for this pass. The source audio is the main listening object.

## Visible Copy Draft

Intro:

```text
周杰伦最难的
5首歌
从真假声、哭腔，到连续高音耐力。
越往后，越考声区和情绪控制。
```

Closing:

```text
真正的难唱
不只是最高音
还要把咬字、气息和情绪一起稳住。
这一组，越温柔越难撑。
```

## Output

```text
sandbox/exports/experiment-019/jay-chou-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-019/jay-chou-top5-vocal-difficulty-contact-sheet.jpg
```

## QA

- Structure check: completed. Top order is `Top5 -> Top4 -> Top3 -> Top2 -> Top1`.
- Visual check: completed via contact sheet. The frame order and visible copy are correct.
- Export check: completed. MP4 is 1080x1920, H.264/AAC, duration 368.42s.
- Audio check: completed. Mean volume -18.8 dB, max volume -2.8 dB.
