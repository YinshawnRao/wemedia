# Brief: 张韶涵最难的5首歌

Experiment: `experiment-020`

## Goal

制作一条竖屏音乐盘点 demo，标题为 `张韶涵最难的5首歌`。用户提供正序排名，成片倒序揭晓，从 Top5 到 Top1。每段取歌曲最难的高位、强混、情绪推进或爆发段，保留原曲声音。

## Audience

面向张韶涵歌迷、华语流行听众、KTV挑战和声乐难度讨论人群。文字要像音乐科普短视频，不出现任何项目约束、提示词、素材下载流程或内部目录信息。

## Structure

| Order | Visible Rank | Song | Visible Difficulty Label | Clip |
|---|---|---|---|---|
| 1 | Top 5 | 引路的风筝 | 明亮高位 | 00:03:16-00:04:28 |
| 2 | Top 4 | 无度 | 暗色推进 | 00:03:24-00:04:40 |
| 3 | Top 3 | 全面沦陷 | 轻快体能局 | 00:02:18-00:03:16 |
| 4 | Top 2 | 破茧 | 爆发穿透 | 00:02:18-00:03:24 |
| 5 | Top 1 | 阿刁 | 换声区强混 | 00:03:35-00:04:48 |

## Visual Direction

- 9:16 vertical, 1080x1920.
- Use `DESIGN.md` palette: dark graphite background, warm cream text, red/teal/gold accents.
- Keep source video centered with blurred background fill.
- Text overlay should be compact: rank, song title, difficulty label, two short music-analysis lines, source label.
- No TTS for this pass. The source audio is the main listening object.

## Visible Copy Draft

Intro:

```text
张韶涵最难的
5首歌
从明亮高音、强混，到现场情绪爆发。
越往后，越考声区、气息和稳定度。
```

Closing:

```text
真正的难唱
不是只看能不能喊上去
还要把力量、明亮度和叙事感一起稳住。
这一组，越到后面越考硬实力。
```

## Output

```text
sandbox/exports/experiment-020/angela-2026-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-020/angela-2026-top5-vocal-difficulty-contact-sheet.jpg
```

## QA

- Structure check: completed. Top order is `Top5 -> Top4 -> Top3 -> Top2 -> Top1`.
- Visual check: completed via contact sheet. The frame order and visible copy are correct.
- Export check: completed. MP4 is 1080x1920, H.264/AAC, duration 355.42s.
- Audio check: completed. Mean volume -18.9 dB, max volume -4.5 dB.
