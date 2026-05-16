# Run Log: Experiment 015

Date: 2026-05-15

## Request

制作“杨丞琳最甜的5首歌”。用户提供歌曲名称和描述，要求搜集每首歌高潮或最高音附近素材并剪辑，成片文案不要包含项目约束或提示词类内容。

## Sources And Clips

| Song | URL | Clip | Note |
|---|---|---|---|
| 庆祝 | https://www.youtube.com/watch?v=R3kR1uhYToY | 00:03:13-00:03:49 | 终段副歌，元气甜度集中 |
| 甜心咒 | https://www.youtube.com/watch?v=pAR74thJz6o | 00:02:50-00:03:35 | 终段 hook + 副歌；首次下载音频流 EOF，降低/改用合并 HLS 格式后成功 |
| 可爱 | https://www.youtube.com/watch?v=RXnwOKeRANc | 00:02:57-00:03:38 | 终段副歌，软萌唱腔明显 |
| 遇上爱 | https://www.youtube.com/watch?v=zfMKCK6JusE | 00:02:55-00:03:44 | 终段副歌，恋爱感完整 |
| 只想爱你 | https://www.youtube.com/watch?v=hpkBwizROaE | 00:03:17-00:04:12 | 终段连续副歌，温柔甜感完整 |

## Output

```text
sandbox/exports/experiment-015/rainie-sweet-songs-preview.mp4
sandbox/exports/experiment-015/rainie-sweet-songs-contact-sheet.jpg
```

## Checks

- `ffprobe`: 1080x1920, H.264, AAC stereo, 236.52s
- `volumedetect`: mean -18.4 dB, max -1.0 dB
- Contact sheet reviewed; visible copy is audience-facing and contains no internal workflow wording.

## Follow-Up Options

- 如果用户喜欢这个甜歌路线，可以把每首段落再调成更完整的副歌。
- 如果要做发布版，需要进一步做授权风险复核和来源替换。
