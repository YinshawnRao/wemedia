# Demo Output

## Files

- Final sandbox demo: `sandbox/exports/experiment-002/chinese-female-singers-demo.mp4`
- Contact sheet: `sandbox/exports/experiment-002/chinese-female-singers-contact-sheet.jpg`
- Source composition: `sandbox/hyperframes/experiment-002/index.html`

## Content

Title: 华语女声 5 种气质

Structure:

```text
0-3s     Title hook
3-9.1s   G.E.M. 邓紫棋 / 爆发力
9.4-15.5s 蔡依林 Jolin / 舞曲能量
15.8-21.9s 孙燕姿 / 叙事感
22.2-28.3s 张惠妹 A-Mei / 力量和现场感
28.6-34.7s 王菲 Faye Wong / 空灵氛围
34.7-38s Closing question
```

## Audio

No paid TTS and no generated voiceover were used.

The demo uses original audio from the source clips. In HyperFrames, each visual clip is a muted `<video>` layer with a matching `<audio>` layer from the same MP4 source, which keeps playback and rendering stable.

## QA

- Exported MP4 has one H.264 video stream and one AAC stereo audio stream.
- Audio is non-empty: mean volume `-18.7 dB`, max volume `-1.4 dB`.
- HyperFrames lint: `0 errors, 0 warnings`.
- HyperFrames inspect: `0 layout issues across 12 samples`.

## Publishing Risk

This is a sandbox-only workflow test. The music clips are marked `rights_review`. Do not treat this file as publish-ready until source rights, platform music-library permissions, or a legally safer commentary/review format are confirmed.
