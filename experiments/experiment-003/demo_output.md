# Demo Output

## Files

- Final local preview: `sandbox/exports/experiment-003/chinese-female-singers-long-chorus-preview.mp4`
- Contact sheet: `sandbox/exports/experiment-003/chinese-female-singers-long-chorus-contact-sheet.jpg`
- HyperFrames source: `sandbox/hyperframes/experiment-003/index.html`
- Fast preview script: `experiments/experiment-003/render_ffmpeg_preview.sh`

## Content

Title: 华语女声 10 个副歌瞬间

Structure:

```text
0-4s       Title
4-31s      G.E.M. 邓紫棋
31-58s     蔡依林 Jolin
59-86s     孙燕姿
86-113s    张惠妹 A-Mei
113-140s   王菲 Faye Wong
141-168s   梁静茹 Fish Leong
168-195s   田馥甄 Hebe
195-222s   张韶涵 Angela
222-250s   林忆莲 Sandy Lam
250-277s   王心凌 Cyndi
277-280s   Closing
```

## Audio

No TTS and no generated voiceover were used.

Each singer segment uses original source audio from the downloaded excerpt. The final preview has one AAC stereo track at 48000 Hz.

## QA

- Exported MP4 has one H.264 video stream and one AAC stereo audio stream.
- Audio is non-empty: mean volume `-18.4 dB`, max volume `-1.1 dB`.
- HyperFrames source passes lint and inspect even though the final preview was rendered with ffmpeg for speed.

## Notes

This is a local sandbox preview. The clip length is intentionally longer than `experiment-002` so each singer gets enough time for a chorus or hook to land.
