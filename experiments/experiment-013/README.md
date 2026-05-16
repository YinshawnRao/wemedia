# Experiment 013: 陶喆难度最高的5首歌

方向：用户提供陶喆歌曲难度排名和描述文字。成片按 TOP 视频项目规则倒序揭晓，从 Top5 到 Top1。每段取歌曲最高音或最高难度段落，保留原曲声音，叠加用户提供的难点描述压缩文案。

## User Ranking

| User Rank | Song | User Difficulty Description |
|---|---|---|
| 1 | 不爱 | 陶喆公认最难，音域跨度极大，副歌持续 High C 强咬字，气息与声带负荷拉满，极少现场唱。 |
| 2 | 爱是个什么东西 | 开篇全程高能，持续高音加刁钻转音，律动怪异，极难稳住气息和节奏。 |
| 3 | 飞机场的10:30 | R&B 难度天花板，真假声极速切换、密集转音，节奏难把控。 |
| 4 | 心乱飞 | 后半段连续高频强混高音，咬字紧绷，长时间高音输出极易破音。 |
| 5 | 望春风 | 爵士编曲，连绵密集转音，音准、语感、气息细节要求极高，很难唱出韵味。 |

## Edit Order

| Video Rank | Song | Source Type | Clip | Cut Reason |
|---|---|---|---|---|
| Top 5 | 望春风 | Official MV | 00:02:02-00:02:52 | 第二段副歌与爵士转音密集区 |
| Top 4 | 心乱飞 | Official artist audio | 00:02:31-00:03:35 | 后半段连续 `Tell me do I` 高位输出 |
| Top 3 | 飞机场的10:30 | Official MV | 00:03:32-00:04:24 | 尾段 R&B 假声/真声切换与转音 |
| Top 2 | 爱是个什么东西 | Official MV | 00:03:12-00:04:08 | Bridge 后连续高能副歌与 ad-lib |
| Top 1 | 不爱 | Official artist audio | 00:02:36-00:03:18 | 终段 High C 压力与 `I LOVE YOU FOREVER` |

## Editorial Rules

- Visible title: `陶喆难度最高的5首歌`
- Reveal order: `Top5 -> Top4 -> Top3 -> Top2 -> Top1`
- Do not expose `倒序` or `倒数` in the title.
- Pitch wording should remain conservative unless formally verified; this version uses `参考难点` rather than exact official pitch claims.
- Rights status is `rights_review`; this is a local sandbox preview, not a publishing package.

## Output

Generated:

```text
sandbox/exports/experiment-013/david-tao-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-013/david-tao-top5-vocal-difficulty-contact-sheet.jpg
```

## Verification

- Exported on 2026-05-15.
- Video: 1080x1920, H.264, 30fps, duration 274.388s.
- Audio: AAC stereo, 48000 Hz; volumedetect mean -19.2 dB, max 0.0 dB.
- Contact sheet confirms order: intro -> Top5 望春风 -> Top4 心乱飞 -> Top3 飞机场的10:30 -> Top2 爱是个什么东西 -> Top1 不爱 -> closing.

## Current Judgment

This pass is a usable local preview. It keeps the user-provided ranking, reveals it as Top5 -> Top1, and avoids exposing "倒序/倒数" in the visible title. The `不爱` source is logged with YouTube metadata title `Forever`; keep that note for traceability.
