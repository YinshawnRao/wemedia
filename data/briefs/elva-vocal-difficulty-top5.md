# Brief: 萧亚轩最难的5首歌

Experiment: `experiment-021`

## Goal

制作一条竖屏音乐盘点 demo，标题为 `萧亚轩最难的5首歌`。用户提供正序排名，成片倒序揭晓，从 Top5 到 Top1。每段取歌曲最难的快歌咬字、律动气息、持续高位、换声点或细腻情绪段，保留原曲声音。

## Audience

面向华语流行听众、Elva 歌迷、KTV挑战和唱跳能力讨论人群。文字要像音乐科普短视频，不出现任何项目约束、提示词、素材下载流程或内部目录信息。

## Structure

| Order | Visible Rank | Song | Visible Difficulty Label | Clip |
|---|---|---|---|---|
| 1 | Top 5 | 不爱请闪开 | 快歌攻击性 | 00:02:10-00:03:18 |
| 2 | Top 4 | 类似爱情 | 细腻推高 | 00:03:06-00:04:20 |
| 3 | Top 3 | 遗失的心跳 | 高位续航 | 00:03:00-00:04:18 |
| 4 | Top 2 | 表白 | 唱跳气息 | 00:02:04-00:03:12 |
| 5 | Top 1 | 最熟悉的陌生人 | 换声点情绪 | 00:02:40-00:03:58 |

## Visual Direction

- 9:16 vertical, 1080x1920.
- Use `DESIGN.md` palette: dark graphite background, warm cream text, red/teal/gold accents.
- Keep source video centered with blurred background fill.
- Text overlay should be compact: rank, song title, difficulty label, two short music-analysis lines, source label.
- No TTS for this pass. The source audio is the main listening object.

## Visible Copy Draft

Intro:

```text
萧亚轩最难的
5首歌
从唱跳气息、快歌咬字，到破碎情绪控制。
越往后，越考节奏、换声和稳定度。
```

Closing:

```text
真正的难唱
不只看高音
还要把律动、气息和情绪都稳住。
这一组，越克制越难。
```

## Output

```text
sandbox/exports/experiment-021/elva-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-021/elva-top5-vocal-difficulty-contact-sheet.jpg
```

## QA

- Structure check: completed. Top order is `Top5 -> Top4 -> Top3 -> Top2 -> Top1`.
- Visual check: completed via contact sheet. The frame order and visible copy are correct.
- Export check: completed. MP4 is 1080x1920, H.264/AAC, duration 376.52s.
- Audio check: completed. Mean volume -18.4 dB, max volume -0.5 dB.
