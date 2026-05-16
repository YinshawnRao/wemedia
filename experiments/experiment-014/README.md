# Experiment 014: 王力宏难度最高的5首歌

方向：用户提供王力宏歌曲难度排名和描述文字。成片按 TOP 视频项目规则倒序揭晓，从 Top5 到 Top1。每段取歌曲最高音或最高难度段落，保留原曲声音，叠加用户提供的难点描述压缩文案。

## User Ranking

| User Rank | Song | User Difficulty Description |
|---|---|---|
| 1 | 缘分一道桥 | 合唱神曲，副歌五组高音密集，最高音达 E5，声区衔接与混声平衡要求极致。 |
| 2 | 就是现在 | 全程高能，A4/G4 高音上百个，含 C5/D5 长音，全强混声，现场常垫原声。 |
| 3 | 爱错 | 混声教科书，主歌 C#5、副歌 D#5，换声点转音复杂，真假声切换极易断层。 |
| 4 | 天地龙鳞 | 副歌大量 C#4 闭口音，气息支撑与胸腔共鸣要求拉满，少力则虚、多力则僵。 |
| 5 | 脚本 | 换声点地狱，高音卡在 G#4-Bb4，咬字刁钻，副歌强混 + 真假转换，极易挤嗓破音。 |

## Edit Order

| Video Rank | Song | Source Type | Clip | Cut Reason |
|---|---|---|---|---|
| Top 5 | 脚本 | Official live video | 00:02:29-00:03:22 | 尾段副歌强混与真假声转换密集区 |
| Top 4 | 天地龙鳞 | Official MV | 00:02:15-00:03:12 | 后段副歌闭口音与共鸣支撑段落 |
| Top 3 | 爱错 | Official artist video | 00:02:43-00:03:38 | Bridge 后最终副歌与 ad-lib，换声点压力最集中 |
| Top 2 | 就是现在 | Official MV | 00:03:32-00:04:24 | 尾段全强混高能副歌与长音 |
| Top 1 | 缘分一道桥 | Official MV | 00:02:44-00:04:08 | 终段连续副歌，密集高音与声区衔接最突出 |

## Editorial Rules

- Visible title: `王力宏难度最高的5首歌`
- Reveal order: `Top5 -> Top4 -> Top3 -> Top2 -> Top1`
- Do not expose `倒序` or `倒数` in the title.
- Pitch wording should remain conservative unless formally verified; this version uses `参考难点` and user-provided pitch labels.
- Rights status is `rights_review`; this is a local sandbox preview, not a publishing package.

## Output

Generated:

```text
sandbox/exports/experiment-014/leehom-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-014/leehom-top5-vocal-difficulty-contact-sheet.jpg
```

## Verification

- Exported on 2026-05-15.
- Video: 1080x1920, H.264, 30fps, duration 311.521s.
- Audio: AAC stereo, 48000 Hz; volumedetect mean -17.9 dB, max -1.3 dB.
- Contact sheet confirms order: intro -> Top5 脚本 -> Top4 天地龙鳞 -> Top3 爱错 -> Top2 就是现在 -> Top1 缘分一道桥 -> closing.

## Current Judgment

This pass is a usable local preview. It keeps the user-provided ranking, reveals it as Top5 -> Top1, and avoids exposing "倒序/倒数" in the visible title. `脚本` uses an official live source because it better demonstrates real passaggio and mixed-voice pressure than non-artist lyric uploads.
