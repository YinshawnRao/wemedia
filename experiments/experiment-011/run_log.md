# Run Log: Experiment 011

## 2026-05-13

Goal: make a local sandbox preview for a four-singer vocal difficulty roundup: Jay Chou, Wang Leehom, David Tao, and JJ Lin. One song per singer, each cut around the high-difficulty section, preserving the original music audio and adding music-analysis text overlays.

Selection:

| Singer | Song | Reason |
|---|---|---|
| 周杰伦 | 搁浅 | High-register chorus with compressed articulation and emotional pressure. |
| 王力宏 | 你不在 | Strong mixed voice, interval jumps, and tail-end intensity. |
| 陶喆 | 黑色柳丁 | Replaced `普通朋友`; better fit for rock/R&B pressure, groove, and articulation difficulty. |
| 林俊杰 | 不为谁而作的歌 | High mixed-voice line and sustained stability. |

Render path:

1. Use already downloaded yt-dlp sandbox clips from `sandbox/yt-dlp/clips/experiment-011/`.
2. Reframe each clip to 1080x1920 with blurred background and centered source video.
3. Generate title and segment overlays as SVG.
4. Render SVG overlays to PNG through Chrome headless.
5. Overlay PNGs and concatenate segments with ffmpeg.

Output:

```text
sandbox/exports/experiment-011/male-four-vocal-difficulty-preview.mp4
sandbox/exports/experiment-011/male-four-vocal-difficulty-contact-sheet.jpg
```

Verification:

```text
duration: 170.087667s
video: h264, 1080x1920, 30fps
audio: aac, stereo, 48000 Hz
mean_volume: -18.9 dB
max_volume: -4.9 dB
```

Notes:

- User correctly challenged `普通朋友` as not difficult enough for this concept. The better principle is: for combination difficulty videos, choose the song that best represents the singer's actual hard mode, not merely the most recognizable classic.
- Pitch labels remain local reference notes. Keep `参考峰值` wording unless exact notes are validated later.
- This version should be reviewed mainly for song choice, clip timing, and whether the four difficulty angles feel persuasive.
