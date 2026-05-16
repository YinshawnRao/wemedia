# Brief: 张韶涵最甜的5首歌

Experiment: `experiment-018`

## Goal

制作一条本地实验版竖屏音乐盘点视频：张韶涵最甜的5首歌。按用户提供排名倒序揭晓，每段取最甜的副歌或 Hook 段落，保留原曲声音。

## Audience

张韶涵歌迷、华语甜歌听众、喜欢早期元气流行乐和青春恋爱氛围的短视频观众。重点是让观众听到每首歌不同的甜感。

## Format

- Canvas: 9:16 vertical, 1080x1920
- Structure: intro 5s + 5 clips around 51-63s each + closing 5s
- Visible title: 张韶涵最甜的5首歌
- Reveal order: Top5 -> Top4 -> Top3 -> Top2 -> Top1
- Voiceover: none
- Audio: source music audio only
- Overlay text: rank, song title, compressed sweet-song mood note, source label
- Style source: `DESIGN.md`

## Edit Order

| Video Rank | Song | Clip | Overlay Note |
|---|---|---|---|
| Top 5 | 爱上爱的味道 | 00:02:20-00:03:15 | 热恋清甜，软糯灵动。 |
| Top 4 | C大调 | 00:02:23-00:03:14 | 干净明朗，轻松温柔。 |
| Top 3 | 香水百合 | 00:01:48-00:02:45 | 清新明媚，自然不腻。 |
| Top 2 | 头号甜心 | 00:02:30-00:03:33 | 俏皮灵动，青春恋爱。 |
| Top 1 | 喜欢你没道理 | 00:02:20-00:03:16 | 元气轻快，少女甜蜜。 |

## Editorial Caution

Rights status is `rights_review`; this is a local experiment, not a publishing package. Visible video copy must not include internal workflow, prompt, project constraint, sandbox, or experiment wording.

## Generated Output

```text
sandbox/exports/experiment-018/angela-sweet-songs-top5-preview.mp4
sandbox/exports/experiment-018/angela-sweet-songs-top5-contact-sheet.jpg
```

## QA Notes

- Rendered preview is 1080x1920, 292.45s, H.264/AAC.
- Source music audio is present; measured max volume is around -1.9 dB.
- Contact sheet confirms the title card, five ranked song cards, and closing card are audience-facing and do not expose internal workflow wording.
