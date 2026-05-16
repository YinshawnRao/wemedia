# Run Log: Experiment 033

Date: 2026-05-16

Topic: 孙楠最难的5首歌

## Goal

Create a local short-video preview using the user's ranked list, but reveal it as `Top5 -> Top1` for suspense. Each clip should use the hardest or most representative difficulty moment and retain original source audio.

## Source Selection

Selected sources:

- Top 5 `不见不散`: EVERGRANDE MUSIC HD upload, 00:02:42-00:03:16.
- Top 4 `风往北吹`: NS Music Channel lyric video preview source, 00:03:16-00:03:50.
- Top 3 `你快回来`: EVERGRANDE MUSIC HD upload, 00:02:45-00:03:19.
- Top 2 `燃烧`: Sun Nan Topic audio source, 00:03:18-00:03:52.
- Top 1 `拯救`: 孫楠 Topic audio source, 00:04:10-00:04:44.

All sources remain `rights_review`.

## Download

Output directory:

```text
sandbox/yt-dlp/clips/experiment-033/
```

Result:

- Five MP4 clips downloaded successfully.
- Subtitles were intentionally skipped because this preview uses source audio and custom overlay copy.
- A sandboxed `yt-dlp` smoke check reproduced the known PyInstaller semaphore permission error; the actual searches and downloads were run sequentially with approved local permissions.

## Render

Renderer:

```text
experiments/experiment-033/render_top5_preview_pillow.py
```

Output:

```text
sandbox/exports/experiment-033/sun-nan-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-033/sun-nan-top5-vocal-difficulty-contact-sheet.jpg
```

## QA

- Syntax check passed for the renderer and shared Pillow renderer.
- Export check passed: 1080x1920, H.264 video, AAC stereo audio, about 180.5 seconds.
- Audio check passed for local preview: mean volume around -19.0 dB, peak around -3.7 dB.
- Contact sheet check passed: intro, Top5 through Top1, and closing card are readable.
- Visible copy scan passed: no internal workflow, prompt, project, sandbox, or Codex wording appears in the video text.

## Takeaways

- 孙楠难度盘点适合强调高位力量、持续声压、厚度、穿透力、真假声转换和后段续航。
- 如果原曲官方 MV 不好找，Topic audio can be acceptable for a first local difficulty preview when the goal is to hear the hard vocal section; log visual-static caveats clearly.
