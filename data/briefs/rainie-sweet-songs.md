# Brief: 杨丞琳最甜的5首歌

Experiment: `experiment-015`

## Goal

制作一条本地实验版竖屏音乐盘点视频：杨丞琳最甜的5首歌。按用户给定歌单和描述呈现，每段取高潮或最高音附近段落，保留原曲声音。

## Audience

华语甜歌听众、杨丞琳早期甜妹风格受众、怀旧流行乐听众。重点是让观众听到元气、俏皮、软萌、青涩和温柔五种甜感。

## Format

- Canvas: 9:16 vertical, 1080x1920
- Structure: intro 5s + 5 clips around 36-55s each + closing 5s
- Visible title: 杨丞琳最甜的5首歌
- Ranking: theme list in user-provided order, not a hard TOP ranking
- Voiceover: none
- Audio: source music audio only
- Overlay text: order number, song title, compressed sweet-song mood note, source label
- Style source: `DESIGN.md`

## Edit Order

| Order | Song | Clip | Overlay Note |
|---|---|---|---|
| 01 | 庆祝 | 00:03:13-00:03:49 | 元气欢快，少女感十足。 |
| 02 | 甜心咒 | 00:02:50-00:03:35 | 俏皮律动，甜度拉满。 |
| 03 | 可爱 | 00:02:57-00:03:38 | 软萌清新，唱腔清甜。 |
| 04 | 遇上爱 | 00:02:55-00:03:44 | 轻快甜蜜，青涩恋爱感。 |
| 05 | 只想爱你 | 00:03:17-00:04:12 | 温柔清甜，嗓音软糯。 |

## Editorial Caution

Rights status is `rights_review`; this is a local experiment, not a publishing package. Visible video copy must not include internal workflow, prompt, project constraint, or sandbox wording.

## Generated Output

```text
sandbox/exports/experiment-015/rainie-sweet-songs-preview.mp4
sandbox/exports/experiment-015/rainie-sweet-songs-contact-sheet.jpg
```

## QA Notes

- Rendered preview is 1080x1920, 236.52s, H.264/AAC.
- Source music audio is present; measured max volume is around -1.0 dB.
- Contact sheet confirms the title card, five song cards, and closing card are audience-facing and do not expose internal workflow wording.
