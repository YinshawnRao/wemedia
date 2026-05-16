# Run Log: Experiment 016

Date: 2026-05-15

## Request

制作“林俊杰最难的5首歌”。用户提供歌曲名称和描述，要求搜集每首歌最高音或最高难度段落附近素材并剪辑，成片文案不要包含项目约束或提示词类内容。

## Sources And Clips

| Video Rank | Song | URL | Clip | Note |
|---|---|---|---|---|
| Top 5 | 无法克制 | https://www.youtube.com/watch?v=CEqwRGpHINc | 00:02:54-00:03:50 | 林俊杰官方频道音频；真假声切换与转音压力集中 |
| Top 4 | 超越无限 | https://www.youtube.com/watch?v=1CFQ1t5WqeY | 00:03:12-00:04:08 | 官方 MV；尾段快节奏高腔与强混持续输出 |
| Top 3 | 不为谁而作的歌 | https://www.youtube.com/watch?v=gd38-X3HpbM | 00:03:32-00:04:36 | 官方 MV；连续高音与气口压力集中 |
| Top 2 | 学不会 | https://www.youtube.com/watch?v=27R6ZavdzzQ | 00:03:03-00:04:02 | 华纳官方 MV；后段换声区长线和高音长音集中 |
| Top 1 | 无拘 | https://www.youtube.com/watch?v=NeRSqC1xuDI | 00:03:19-00:04:30 | 官方 MV；尾段超高音密集和混声转换集中 |

## Output

```text
sandbox/exports/experiment-016/jj-lin-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-016/jj-lin-top5-vocal-difficulty-contact-sheet.jpg
```

## Checks

- `ffprobe`: 1080x1920, H.264, AAC stereo, 316.25s
- `volumedetect`: mean -18.6 dB, max -4.5 dB
- Contact sheet reviewed; visible copy is audience-facing and contains no internal workflow wording.

## Follow-Up Options

- 如果用户觉得整体音量偏小，可以二版提高目标响度后重新导出。
- 如果要做更硬核音乐科普版，需要逐句做音高核对，再决定是否写具体音名。
