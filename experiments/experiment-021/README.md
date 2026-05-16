# Experiment 021: 萧亚轩最难的5首歌

方向：用户提供萧亚轩歌曲排名和描述文字。成片按 TOP 视频项目规则倒序揭晓，从 Top5 到 Top1。每段取歌曲最难的快歌咬字、律动气息、持续高位、换声点或细腻情绪段落，保留素材原声，叠加观众向音乐难点备注。

## User Ranking

| User Rank | Song | User Description |
|---|---|---|
| 1 | 最熟悉的陌生人 | 低音要稳，副歌又卡在换声点，高音不能硬顶，情绪还得唱得碎。 |
| 2 | 表白 | 唱跳节奏密，断句多，副歌还要亮，高音、律动和气息全都不能掉线。 |
| 3 | 遗失的心跳 | 副歌持续高位推进，情绪要越唱越满，气息一松就容易塌。 |
| 4 | 类似爱情 | 主歌低音要有质感，副歌要细腻推高，难在不能用蛮力唱成苦情喊麦。 |
| 5 | 不爱请闪开 | 快歌咬字和重拍很密，高音还要带攻击性，唱稳已经难，边跳边唱更难。 |

## Edit Order

| Video Rank | Song | Source Type | Planned Clip | Cut Reason |
|---|---|---|---|---|
| Top 5 | 不爱请闪开 | Official MV | 00:02:10-00:03:18 | 终段快歌副歌，密集咬字、重拍和攻击性集中 |
| Top 4 | 类似爱情 | Official MV | 00:03:06-00:04:20 | 后段副歌，低位质感后推高的细腻度集中 |
| Top 3 | 遗失的心跳 | Official MV | 00:03:00-00:04:18 | 后段副歌，持续高位和情绪堆叠集中 |
| Top 2 | 表白 | Official artist-channel source | 00:02:04-00:03:12 | 后段副歌，断句、律动、气息和亮度集中 |
| Top 1 | 最熟悉的陌生人 | Official MV | 00:02:40-00:03:58 | 终段副歌，低音铺垫、换声点和破碎情绪集中 |

## Editorial Rules

- Visible title: `萧亚轩最难的5首歌`
- Reveal order: `Top5 -> Top4 -> Top3 -> Top2 -> Top1`
- Do not expose internal workflow, project constraints, prompt wording, sandbox wording, or countdown mechanics in visible copy.
- User-facing copy should emphasize singing difficulty: breath, rhythm, diction, register bridge, emotional restraint, and dance-pop stamina.
- Rights status is `rights_review`; this is a local sandbox preview, not a publishing package.

## Output

Generated:

```text
sandbox/exports/experiment-021/elva-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-021/elva-top5-vocal-difficulty-contact-sheet.jpg
```

## Verification

- Exported on 2026-05-16.
- Video: 1080x1920, H.264, 30fps, duration 376.52s.
- Audio: AAC stereo, 48000 Hz; volumedetect mean -18.4 dB, max -0.5 dB.
- Contact sheet confirms order: intro -> Top5 不爱请闪开 -> Top4 类似爱情 -> Top3 遗失的心跳 -> Top2 表白 -> Top1 最熟悉的陌生人 -> closing.

## Current Judgment

This pass is a usable local preview. It follows the user ranking but reveals it from Top5 to Top1. Visible copy uses audience-facing rank, song title, difficulty label, two short music-analysis lines, and source label, with no internal workflow or prompt wording.

## Runtime Notes

- `遗失的心跳` first failed on split audio with an EOF error. It succeeded after retrying with muxed format `18`.
