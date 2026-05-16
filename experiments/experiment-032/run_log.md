# Run Log: Experiment 032

Date: 2026-05-16

Topic: 梁静茹最难的5首歌

## Goal

Create a local short-video preview using the user's ranked list, but reveal it as `Top5 -> Top1` for suspense. Each clip should use the hardest or most representative difficulty moment and retain original source audio.

## Source Selection

Selected sources:

- Top 5 `无条件为你`: 滾石唱片 ROCK RECORDS official MV, 00:02:58-00:03:32.
- Top 4 `情歌`: 梁靜茹 Fish Leong official artist/Topic source, 00:02:52-00:03:26.
- Top 3 `崇拜`: 梁靜茹 Fish Leong official artist/Topic source, 00:02:48-00:03:22.
- Top 2 `丝路`: 滾石唱片 ROCK RECORDS official MV, 00:03:26-00:04:00.
- Top 1 `燕尾蝶`: 滾石唱片 ROCK RECORDS official MV, 00:03:24-00:03:58.

All sources remain `rights_review`.

## Download

Output directory:

```text
sandbox/yt-dlp/clips/experiment-032/
```

Result:

- Five MP4 clips downloaded successfully.
- Subtitle downloads were skipped intentionally because this preview uses source audio and custom overlay copy.
- `情歌` and `崇拜` are visually static audio-style sources, but the audio is clean and fits the local difficulty preview.

## Render

Renderer:

```text
experiments/experiment-032/render_top5_preview_pillow.py
```

Output:

```text
sandbox/exports/experiment-032/fish-leong-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-032/fish-leong-top5-vocal-difficulty-contact-sheet.jpg
```

## QA

- Syntax check passed for the renderer and shared Pillow renderer.
- Export check passed: 1080x1920, H.264 video, AAC stereo audio, about 180.5 seconds.
- Audio check passed for local preview: mean volume around -19.1 dB, peak around -4.4 dB.
- Contact sheet check passed: intro, Top5 through Top1, and closing card are readable.
- Visible copy scan passed: no internal workflow, prompt, project, sandbox, or Codex wording appears in the video text.

## Takeaways

- 梁静茹难度视频适合强调温柔控制：清透高位、真假声边缘、气息线条、音准细节和情绪层次。
- 当官方 MV 不易找到时，官方 artist/Topic 音频源可作为本地预览的声音优先方案；如果用户想要更强画面感，二版再替换成 MV 或现场备选。
