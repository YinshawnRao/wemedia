# Run Log: Experiment 024

## 2026-05-16

- Goal: 制作 `林俊杰为别人创作的歌TOP5` 本地实验短视频。
- Reveal order: `Top5 -> Top4 -> Top3 -> Top2 -> Top1`.
- Download mode: `WEMEDIA_OUTPUT_MODE=test`.
- Runtime: yt-dlp with Chrome cookies and node runtime.

## Clips Downloaded

| Rank | Song | Performer | Clip | Source |
|---|---|---|---|---|
| Top 5 | 爱笑的眼睛 | 徐若瑄 | 00:03:00-00:03:42 | avex official MV |
| Top 4 | 一眼万年 | S.H.E | 00:02:55-00:04:05 | HIM official MV |
| Top 3 | 心墙 | 郭静 | 00:02:40-00:03:36 | 福茂 official MV |
| Top 2 | 当你 | 王心凌 | 00:02:46-00:03:30 | avex official MV |
| Top 1 | 记得 | 张惠妹 | 00:03:05-00:04:25 | Timeless Music official MV |

## Render

- Initial renderer: Chrome-rendered SVG/PNG overlays plus ffmpeg.
- Blocker: local Chrome/headless escalation was unavailable in this session.
- Fallback renderer: Pillow-generated PNG overlays plus ffmpeg.
- Output: `sandbox/exports/experiment-024/jj-lin-songs-for-others-top5-preview.mp4`.

## QA

- Video: `1080x1920`, H.264, 30 fps.
- Audio: AAC stereo, 48 kHz.
- Duration: `302.421333s`.
- Audio loudness check: mean `-18.9 dB`, max `-1.5 dB`.
- Contact sheet: `sandbox/exports/experiment-024/jj-lin-songs-for-others-top5-contact-sheet.jpg`.
- Visible copy: audience-facing only; title, rank, performer, lyricist, composer, source label and short note.
