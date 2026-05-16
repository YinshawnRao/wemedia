# Experiment 031: 张惠妹最难的5首歌

方向：用户提供张惠妹 5 首高难度歌曲排名与描述。成片按 TOP 视频项目规则倒序揭晓，从 Top5 到 Top1。每段取歌曲里最能体现演唱难点的一段，保留原声，叠加排名、歌名、歌手和观众向演唱难点说明。

## User Ranking

| User Rank | Song | User Description |
|---|---|---|
| 1 | 彩虹 | 主歌低音要稳，副歌连续高强度呐喊，Bridge 几乎不给喘息空间。 |
| 2 | 这样你还要爱我吗 | 长时间高压输出，后段嘶吼和高音层层叠加，情绪崩溃但声音不能真的崩。 |
| 3 | 血腥爱情故事 | 副歌长期卡在高音区，咬字、力量和戏剧张力都很狠。 |
| 4 | 如果你也听说 | 弱起、推进、爆发和收尾都要精准，唱重了俗，唱轻了没戏。 |
| 5 | 也许明天 | 音域跨度大，情绪一路往上推，高音要有穿透力还不能喊散。 |

## Edit Order

| Video Rank | Song | Source Type | Planned Clip | Cut Reason |
|---|---|---|---|---|
| Top 5 | 也许明天 | Official MV | 00:03:34-00:04:08 | 尾段情绪上推和高音穿透集中 |
| Top 4 | 如果你也听说 | Official MV | 00:03:18-00:03:52 | 弱起推进到爆发的段落更完整 |
| Top 3 | 血腥爱情故事 | Official MV | 00:03:04-00:03:38 | 高音区咬字、力量和戏剧张力集中 |
| Top 2 | 这样你还要爱我吗 | Official MV | 00:04:24-00:04:58 | 后段高压输出和情绪爆发集中 |
| Top 1 | 彩虹 | Official Video | 00:02:35-00:03:09 | Bridge 与连续呐喊段更能体现体力压力 |

## Editorial Rules

- Visible title: `张惠妹最难的歌` + line break + `TOP5`.
- Only `TOP5` may be separated as the large title line break.
- Reveal order: `Top5 -> Top4 -> Top3 -> Top2 -> Top1`.
- Visible copy focuses on vocal difficulty: breath stamina, belting, grit, diction, dynamics, and dramatic pressure.
- Visible copy must not mention internal workflow, prompt text, source collection process, sandbox, or project constraints.
- Rights status is `rights_review`; this is a local experiment preview, not a publishing package.

## Output

Preview video:

```text
sandbox/exports/experiment-031/amei-top5-vocal-difficulty-preview.mp4
```

Contact sheet:

```text
sandbox/exports/experiment-031/amei-top5-vocal-difficulty-contact-sheet.jpg
```

## QA Result

- Structure: passed. The edit reveals `Top5 -> Top4 -> Top3 -> Top2 -> Top1`.
- Visual: passed. Contact sheet shows the intro, five rank cards, and closing card clearly.
- Export: passed. Output is 1080x1920, H.264 video, AAC stereo audio, about 180.5 seconds.
- Audio: passed for local preview. `volumedetect` reported mean volume around -18.7 dB and max volume around -2.6 dB.
- Copy safety: passed. Visible text scan found no internal workflow, prompt, project, sandbox, or Codex wording.
- Rights: `rights_review`. This remains a local experiment preview.

## Notes

- Top 1 `彩虹` hit YouTube subtitle HTTP 429 when requesting subtitles. The video clip itself downloaded successfully after rerunning the same source and cut with subtitle download disabled.
- For 张惠妹 difficulty videos, the strongest copy angle is sustained pressure: low-to-high stability, high belting, breath stamina, grit, and emotional tension that still stays controlled.
