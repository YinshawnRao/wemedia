# Run Log: Experiment 031

Date: 2026-05-16

Topic: 张惠妹最难的5首歌

## Goal

Create a local short-video preview using the user's ranked list, but reveal it as `Top5 -> Top1` for suspense. Each clip should use the hardest or most representative difficulty moment and retain original source audio.

## Source Selection

Selected mostly official MV or official video sources:

- Top 5 `也许明天`: Timeless Music official MV, 00:03:34-00:04:08.
- Top 4 `如果你也听说`: Timeless Music official MV, 00:03:18-00:03:52.
- Top 3 `血腥爱情故事`: 聲動娛樂 Mei Entertainment official MV, 00:03:04-00:03:38.
- Top 2 `这样你还要爱我吗`: 聲動娛樂 Mei Entertainment official MV, 00:04:24-00:04:58.
- Top 1 `彩虹`: 聲動娛樂 Mei Entertainment official video, 00:02:35-00:03:09.

All sources remain `rights_review`.

## Download

Output directory:

```text
sandbox/yt-dlp/clips/experiment-031/
```

Result:

- Five MP4 clips downloaded successfully.
- Top 1 `彩虹` initially failed while retrieving subtitles with HTTP 429. The same source and cut downloaded successfully after disabling subtitle download. The download script now uses the no-subtitle path for that clip.

## Render

Renderer:

```text
experiments/experiment-031/render_top5_preview_pillow.py
```

Output:

```text
sandbox/exports/experiment-031/amei-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-031/amei-top5-vocal-difficulty-contact-sheet.jpg
```

## QA

- Syntax check passed for the renderer and shared Pillow renderer.
- Export check passed: 1080x1920, H.264 video, AAC stereo audio, about 180.5 seconds.
- Audio check passed for local preview: mean volume around -18.7 dB, peak around -2.6 dB.
- Contact sheet check passed: intro, Top5 through Top1, and closing card are readable.
- Visible copy scan passed: no internal workflow, prompt, project, sandbox, or Codex wording appears in the video text.

## Takeaways

- 张惠妹的难度文案适合强调持续声压、气息续航、低高音跨度、嘶吼质感和情绪控制。
- 如果 YouTube subtitle retrieval hits HTTP 429, keep the same source and cut, then retry the clip without subtitles before replacing sources.
