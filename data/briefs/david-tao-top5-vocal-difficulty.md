# Brief: 陶喆难度最高的5首歌

Experiment: `experiment-013`

## Goal

制作一条本地实验版竖屏音乐盘点视频：陶喆难度最高的5首歌。排名和难点描述由用户提供；成片按倒序揭晓，从 Top5 到 Top1，每段取最高音或最高难度片段，保留原曲声音。

## Audience

华语 R&B 听众、陶喆粉丝、KTV/声乐爱好者。重点是让观众听到“为什么难”：转音、节奏、真假声切换、强混、咬字和气息负荷。

## Format

- Canvas: 9:16 vertical, 1080x1920
- Structure: intro 5s + 5 clips around 42-64s each + closing 5s
- Visible title: 陶喆难度最高的5首歌
- Ranking: countdown, `Top5 -> Top1`
- Voiceover: none
- Audio: source music audio only
- Overlay text: rank, song title, compressed user difficulty description, source label
- Style source: `DESIGN.md`

## Edit Order

| Video Rank | Song | Clip | Overlay Note |
|---|---|---|---|
| Top 5 | 望春风 | 00:02:02-00:02:52 | 爵士编曲 + 密集转音，难在音准、语感和气息细节。 |
| Top 4 | 心乱飞 | 00:02:31-00:03:35 | 后半段连续强混高音，咬字紧绷，长时间输出易破音。 |
| Top 3 | 飞机场的10:30 | 00:03:32-00:04:24 | R&B 难度天花板，真假声切换和密集转音都卡节奏。 |
| Top 2 | 爱是个什么东西 | 00:03:12-00:04:08 | 持续高音、刁钻转音、怪律动同时出现。 |
| Top 1 | 不爱 | 00:02:36-00:03:18 | 公认最难之一，持续 High C 强咬字，气息与声带负荷拉满。 |

## Editorial Caution

Pitch labels remain reference notes, not official score claims. Rights status is `rights_review`; this is a local experiment, not a publishing package.

## Current Output

```text
sandbox/exports/experiment-013/david-tao-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-013/david-tao-top5-vocal-difficulty-contact-sheet.jpg
```

## QA Notes

- Exported as a fast local preview on 2026-05-15.
- Technical check: 1080x1920, H.264, 30fps, AAC stereo, 274.388s.
- Contact sheet confirms the reveal order is Top5 -> Top1 and the visible title does not expose the internal reverse-ranking logic.
- `不爱` source traceability note: the YouTube official metadata title is `Forever`.
