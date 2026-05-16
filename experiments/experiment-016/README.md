# Experiment 016: 林俊杰最难的5首歌

方向：用户提供林俊杰歌曲难度排名和描述文字。成片按 TOP 视频项目规则倒序揭晓，从 Top5 到 Top1。每段取歌曲最高音或最高难度段落附近，保留原曲声音，叠加压缩后的音乐科普备注。

## User Ranking

| User Rank | Song | User Difficulty Description |
|---|---|---|
| 1 | 无拘 | 超高音密集输出，混声转换难度大，气息消耗极强 |
| 2 | 学不会 | 全程卡在换声区，长音高音吃力，极易破音 |
| 3 | 不为谁而作的歌 | 连续高音扎堆，换气空间少，唱功续航要求高 |
| 4 | 超越无限 | 快节奏叠加高腔，强混声持续发力，演唱负荷拉满 |
| 5 | 无法克制 | 真假声极速切换，音域跨度广，转音细腻难把控 |

## Edit Order

| Video Rank | Song | Source Type | Clip | Cut Reason |
|---|---|---|---|---|
| Top 5 | 无法克制 | Official audio | 00:02:54-00:03:50 | 后段真假声切换和转音压力集中 |
| Top 4 | 超越无限 | Official MV | 00:03:12-00:04:08 | 尾段快节奏高腔和强混声持续输出 |
| Top 3 | 不为谁而作的歌 | Official MV | 00:03:32-00:04:36 | 终段连续高音与换气压力最明显 |
| Top 2 | 学不会 | Official MV | 00:03:03-00:04:02 | 后段换声区长线与高音长音集中 |
| Top 1 | 无拘 | Official MV | 00:03:19-00:04:30 | 尾段超高音密集、混声转换和体力消耗集中 |

## Editorial Rules

- Visible title: `林俊杰最难的5首歌`
- Reveal order: `Top5 -> Top4 -> Top3 -> Top2 -> Top1`
- Do not expose internal workflow, project constraints, prompt wording, sandbox wording, or countdown mechanics in visible copy.
- Pitch wording should remain conservative unless formally verified; this version uses `参考难点` rather than absolute pitch claims.
- Rights status is `rights_review`; this is a local sandbox preview, not a publishing package.

## Output

Generated:

```text
sandbox/exports/experiment-016/jj-lin-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-016/jj-lin-top5-vocal-difficulty-contact-sheet.jpg
```

## Verification

- Exported on 2026-05-15.
- Video: 1080x1920, H.264, 30fps, duration 316.25s.
- Audio: AAC stereo, 48000 Hz; volumedetect mean -18.6 dB, max -4.5 dB.
- Contact sheet confirms order: intro -> Top5 无法克制 -> Top4 超越无限 -> Top3 不为谁而作的歌 -> Top2 学不会 -> Top1 无拘 -> closing.

## Current Judgment

This pass is a usable local preview. It preserves the user-provided ranking while revealing it from Top5 to Top1. Visible copy uses audience-facing rank, song title, source label, and conservative `参考难点` wording, with no internal workflow or prompt wording.
