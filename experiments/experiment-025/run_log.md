# Run Log: Experiment 025

## 2026-05-16

- Goal: 制作 `Tank吕建忠为别人创作的歌TOP5` 本地实验短视频。
- Reveal order: `Top5 -> Top4 -> Top3 -> Top2 -> Top1`.
- Download mode: `WEMEDIA_OUTPUT_MODE=test`.
- Runtime: yt-dlp with Chrome cookies and node runtime.

## Clips Downloaded

| Rank | Song | Performer | Clip | Source |
|---|---|---|---|---|
| Top 5 | 天亮以后 | 胡歌 | 00:02:49-00:03:58 | 華研國際 official MV |
| Top 4 | 夏雪 | 飞轮海 | 00:02:55-00:03:55 | 華研國際 official MV |
| Top 3 | 我有我的Young | 飞轮海 | 00:03:13-00:04:12 | 華研國際 official MV |
| Top 2 | 不作你的朋友 | S.H.E | 00:03:13-00:04:18 | 華研國際 official MV |
| Top 1 | 非你莫属 | 林依晨 | 00:03:10-00:04:20 | 華研國際 official MV |

## Render

- Renderer: reusable Pillow-generated PNG overlays plus ffmpeg.
- Shared renderer: `scripts/video/pillow_top5_renderer.py`.
- Output: `sandbox/exports/experiment-025/tank-songs-for-others-top5-preview.mp4`.

## QA

- Video: `1080x1920`, H.264, 30 fps.
- Audio: AAC stereo, 48 kHz.
- Duration: `333.521333s`.
- Audio loudness check: mean `-18.8 dB`, max `-2.0 dB`.
- Contact sheet: `sandbox/exports/experiment-025/tank-songs-for-others-top5-contact-sheet.jpg`.
- Visible copy: audience-facing only; title, rank, performer, lyricist, composer, source label and short note.
