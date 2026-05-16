# Experiment 032: 梁静茹最难的5首歌

方向：用户提供梁静茹 5 首高难度歌曲排名与描述。成片按 TOP 视频项目规则倒序揭晓，从 Top5 到 Top1。每段取歌曲里最能体现演唱难点的一段，保留原声，叠加排名、歌名、歌手和观众向演唱难点说明。

## User Ranking

| User Rank | Song | User Description |
|---|---|---|
| 1 | 燕尾蝶 | 副歌连续高位输出，气口紧，爆发、穿透力和稳定性都难撑。 |
| 2 | 丝路 | 主歌要细，副歌要打开，高音、气息和情绪推进都不能掉。 |
| 3 | 崇拜 | 音区跨度和情绪层次难控，前面要压住，后面要推开。 |
| 4 | 情歌 | 温柔外壳下考验音准、气息和真假声衔接。 |
| 5 | 无条件为你 | 副歌高音明亮又连续，甜度、气息和稳定性都要在线。 |

## Edit Order

| Video Rank | Song | Source Type | Planned Clip | Cut Reason |
|---|---|---|---|---|
| Top 5 | 无条件为你 | Official MV | 00:02:58-00:03:32 | 副歌明亮高音和清透气息集中 |
| Top 4 | 情歌 | Official audio / artist channel | 00:02:52-00:03:26 | 尾段音准、气息和真假声衔接更集中 |
| Top 3 | 崇拜 | Official audio / artist channel | 00:02:48-00:03:22 | 后段情绪层次和爆发推进集中 |
| Top 2 | 丝路 | Official MV | 00:03:26-00:04:00 | 大歌副歌打开和情绪推进集中 |
| Top 1 | 燕尾蝶 | Official MV | 00:03:24-00:03:58 | 副歌连续高位和穿透稳定性集中 |

## Editorial Rules

- Visible title: `梁静茹最难的歌` + line break + `TOP5`.
- Only `TOP5` may be separated as the large title line break.
- Reveal order: `Top5 -> Top4 -> Top3 -> Top2 -> Top1`.
- Visible copy focuses on vocal difficulty: breath line, clarity, mixed voice, pitch control, emotional layering, and high-position stability.
- Visible copy must not mention internal workflow, prompt text, source collection process, sandbox, or project constraints.
- Rights status is `rights_review`; this is a local experiment preview, not a publishing package.

## Output

Preview video:

```text
sandbox/exports/experiment-032/fish-leong-top5-vocal-difficulty-preview.mp4
```

Contact sheet:

```text
sandbox/exports/experiment-032/fish-leong-top5-vocal-difficulty-contact-sheet.jpg
```

## QA Result

- Structure: passed. The edit reveals `Top5 -> Top4 -> Top3 -> Top2 -> Top1`.
- Visual: passed. Contact sheet shows the intro, five rank cards, and closing card clearly.
- Export: passed. Output is 1080x1920, H.264 video, AAC stereo audio, about 180.5 seconds.
- Audio: passed for local preview. `volumedetect` reported mean volume around -19.1 dB and max volume around -4.4 dB.
- Copy safety: passed. Visible text scan found no internal workflow, prompt, project, sandbox, or Codex wording.
- Rights: `rights_review`. This remains a local experiment preview.

## Notes

- `情歌` and `崇拜` use official artist/Topic audio-style sources, so their visual motion is limited compared with full MV sources. The vertical wrapper still keeps rank, title, and difficulty information readable.
- 梁静茹的难度更适合写成“温柔控制型”：清透高位、真假声边缘、气息线条、音准细节和情绪层次，而不是单纯高音竞赛。
