# Brief: 林俊杰最难的5首歌

Experiment: `experiment-016`

## Goal

制作一条本地实验版竖屏音乐盘点视频：林俊杰最难的5首歌。按用户提供排名倒序揭晓，每段取最高音或最高难度附近段落，保留原曲声音。

## Audience

华语流行乐听众、林俊杰歌迷、对演唱难度和唱功拆解感兴趣的短视频观众。重点是让观众听到“难在哪里”，而不是只看歌名。

## Format

- Canvas: 9:16 vertical, 1080x1920
- Structure: intro 5s + 5 clips around 56-71s each + closing 5s
- Visible title: 林俊杰最难的5首歌
- Reveal order: Top5 -> Top4 -> Top3 -> Top2 -> Top1
- Voiceover: none
- Audio: source music audio only
- Overlay text: rank, song title, compressed difficulty label, two short explanatory lines, source label
- Style source: `DESIGN.md`

## Edit Order

| Video Rank | Song | Clip | Overlay Note |
|---|---|---|---|
| Top 5 | 无法克制 | 00:02:54-00:03:50 | 真假声极速切换，转音细节难稳。 |
| Top 4 | 超越无限 | 00:03:12-00:04:08 | 快节奏高腔叠加强混持续输出。 |
| Top 3 | 不为谁而作的歌 | 00:03:32-00:04:36 | 连续高音扎堆，换气空间很少。 |
| Top 2 | 学不会 | 00:03:03-00:04:02 | 长时间卡在换声区，长音极考支撑。 |
| Top 1 | 无拘 | 00:03:19-00:04:30 | 超高音密集，混声转换和气息消耗同时拉满。 |

## Editorial Caution

Rights status is `rights_review`; this is a local experiment, not a publishing package. Visible video copy must not include internal workflow, prompt, project constraint, sandbox, or experiment wording.

## Generated Output

```text
sandbox/exports/experiment-016/jj-lin-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-016/jj-lin-top5-vocal-difficulty-contact-sheet.jpg
```

## QA Notes

- Rendered preview is 1080x1920, 316.25s, H.264/AAC.
- Source music audio is present; measured max volume is around -4.5 dB.
- Contact sheet confirms the title card, five ranked song cards, and closing card are audience-facing and do not expose internal workflow wording.
