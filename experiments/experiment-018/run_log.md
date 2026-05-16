# Run Log: Experiment 018

Date: 2026-05-15

## Request

制作“张韶涵最甜的5首歌”。用户提供歌曲排名和描述，要求搜集每首歌最甜的段落并剪辑，成片文案不要包含项目约束或提示词类内容。

## Sources And Clips

| Video Rank | Song | URL | Clip | Note |
|---|---|---|---|---|
| Top 5 | 爱上爱的味道 | https://www.youtube.com/watch?v=OfbmHsqDcMc | 00:02:20-00:03:15 | 终段副歌，热恋清甜氛围集中 |
| Top 4 | C大调 | https://www.youtube.com/watch?v=NFuKYLfCOxw | 00:02:23-00:03:14 | 终段副歌，干净明朗甜意集中 |
| Top 3 | 香水百合 | https://www.youtube.com/watch?v=8y0OGAA_NKo | 00:01:48-00:02:45 | 后段副歌，清新明媚甜感完整 |
| Top 2 | 头号甜心 | https://www.youtube.com/watch?v=8bUW7Pl3PjM | 00:02:30-00:03:33 | 终段副歌和 Hook，俏皮恋爱感集中 |
| Top 1 | 喜欢你没道理 | https://www.youtube.com/watch?v=rhuNm2X7nbA | 00:02:20-00:03:16 | 终段副歌，元气少女甜感完整 |

## Output

```text
sandbox/exports/experiment-018/angela-sweet-songs-top5-preview.mp4
sandbox/exports/experiment-018/angela-sweet-songs-top5-contact-sheet.jpg
```

## Checks

- `ffprobe`: 1080x1920, H.264, AAC stereo, 292.45s
- `volumedetect`: mean -18.8 dB, max -1.9 dB
- Contact sheet reviewed; visible copy is audience-facing and contains no internal workflow wording.

## Follow-Up Options

- 如果用户觉得某首最甜段落不够“副歌完整”，可以单独替换该段切点再重导。
- 如果要做发布版，需要进一步做授权风险复核和来源替换。
