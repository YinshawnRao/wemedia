# Brief: 王力宏难度最高的5首歌

Experiment: `experiment-014`

## Goal

制作一条本地实验版竖屏音乐盘点视频：王力宏难度最高的5首歌。排名和难点描述由用户提供；成片按倒序揭晓，从 Top5 到 Top1，每段取最高音或最高难度片段，保留原曲声音。

## Audience

华语 R&B/流行听众、王力宏歌迷、KTV/声乐爱好者。重点是让观众听到“为什么难”：强混声、换声点、闭口音、真假声切换、长音体力和密集高音。

## Format

- Canvas: 9:16 vertical, 1080x1920
- Structure: intro 5s + 5 clips around 52-84s each + closing 5s
- Visible title: 王力宏难度最高的5首歌
- Ranking: countdown, `Top5 -> Top1`
- Voiceover: none
- Audio: source music audio only
- Overlay text: rank, song title, compressed user difficulty description, source label
- Style source: `DESIGN.md`

## Edit Order

| Video Rank | Song | Clip | Overlay Note |
|---|---|---|---|
| Top 5 | 脚本 | 00:02:29-00:03:22 | 换声点地狱，高音卡在 G#4-Bb4，强混和真假转换极易挤嗓。 |
| Top 4 | 天地龙鳞 | 00:02:15-00:03:12 | C#4 附近闭口音密集，气息与胸腔共鸣支撑要求很高。 |
| Top 3 | 爱错 | 00:02:43-00:03:38 | 混声教科书，C#5/D#5 区间和换声点转音都难稳。 |
| Top 2 | 就是现在 | 00:03:32-00:04:24 | 全程高能，A4/G4 高频出现，尾段还要扛 C5/D5 长音。 |
| Top 1 | 缘分一道桥 | 00:02:44-00:04:08 | 合唱神曲，副歌多组高音密集，最高音参考 E5。 |

## Editorial Caution

Pitch labels are user-provided reference notes, not official score claims. Rights status is `rights_review`; this is a local experiment, not a publishing package.

## Current Output

```text
sandbox/exports/experiment-014/leehom-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-014/leehom-top5-vocal-difficulty-contact-sheet.jpg
```

## QA Notes

- Exported as a fast local preview on 2026-05-15.
- Technical check: 1080x1920, H.264, 30fps, AAC stereo, 311.521s.
- Contact sheet confirms the reveal order is Top5 -> Top1 and the visible title does not expose the internal reverse-ranking logic.
- `脚本` uses official live footage; this choice is deliberate for real mixed-voice/passaggio pressure.
