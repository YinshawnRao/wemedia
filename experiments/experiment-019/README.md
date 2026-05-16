# Experiment 019: 周杰伦最难的5首歌

方向：用户提供周杰伦歌曲排名和描述文字。成片按 TOP 视频项目规则倒序揭晓，从 Top5 到 Top1。每段取歌曲最难的尾段副歌、高位持续、哭腔或真假声转换段落，保留原曲声音，叠加观众向音乐难点备注。

## User Ranking

| User Rank | Song | User Description |
|---|---|---|
| 1 | 白色风车 | 连续高音特别磨人，听着温柔，实际唱到后面嗓子开始报警。 |
| 2 | 搁浅 | 副歌持续高音输出，最后一段很容易直接破音。 |
| 3 | 枫 | 升Key后特别难稳，既要高音又要情绪，属于“越唱越累”型。 |
| 4 | 一路向北 | 音高跨度大，还得带压抑感和哭腔，普通人副歌就开始顶不住。 |
| 5 | 黑色幽默 | 真假声转换和转音极难控制，情绪和技巧都非常吃状态。 |

## Edit Order

| Video Rank | Song | Source Type | Planned Clip | Cut Reason |
|---|---|---|---|---|
| Top 5 | 黑色幽默 | Official MV | 00:02:56-00:04:08 | 尾段真假声、转音和情绪控制更集中 |
| Top 4 | 一路向北 | Official MV | 00:03:26-00:04:36 | 后段副歌，压抑哭腔和高位输出集中 |
| Top 3 | 枫 | Official MV | 00:03:16-00:04:26 | 后段升Key副歌，情绪和稳定度压力最高 |
| Top 2 | 搁浅 | Official MV | 00:02:52-00:04:02 | 最后一段副歌，持续高音和咬字压力集中 |
| Top 1 | 白色风车 | Official MV | 00:03:18-00:04:34 | 后段连续高音，温柔音色下的耐力难点 |

## Editorial Rules

- Visible title: `周杰伦最难的5首歌`
- Reveal order: `Top5 -> Top4 -> Top3 -> Top2 -> Top1`
- Do not expose internal workflow, project constraints, prompt wording, sandbox wording, or countdown mechanics in visible copy.
- User-facing copy should emphasize singing difficulty: high-position diction, sustained chorus pressure, crying tone, falsetto transition, and emotional control.
- Rights status is `rights_review`; this is a local sandbox preview, not a publishing package.

## Output

Generated:

```text
sandbox/exports/experiment-019/jay-chou-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-019/jay-chou-top5-vocal-difficulty-contact-sheet.jpg
```

## Verification

- Exported on 2026-05-15.
- Video: 1080x1920, H.264, 30fps, duration 368.42s.
- Audio: AAC stereo, 48000 Hz; volumedetect mean -18.8 dB, max -2.8 dB.
- Contact sheet confirms order: intro -> Top5 黑色幽默 -> Top4 一路向北 -> Top3 枫 -> Top2 搁浅 -> Top1 白色风车 -> closing.

## Current Judgment

This pass is a usable local preview. It follows the user ranking but reveals it from Top5 to Top1. Visible copy uses audience-facing rank, song title, difficulty label, two short music-analysis lines, and source label, with no internal workflow or prompt wording.
