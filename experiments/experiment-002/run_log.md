# Run Log

## 2026-05-10

- Created experiment folder.
- Set concept: 华语女声 5 种气质.
- Searched YouTube with yt-dlp using Chrome cookies and Node runtime.
- Selected five official-source candidates for sandbox-only testing.
- No final publishing rights are assumed.
- Downloaded five short music-video excerpts into `sandbox/yt-dlp/clips/experiment-002/`.
- Re-encoded excerpts into HyperFrames-friendly vertical MP4 assets with preserved AAC audio:
  - `sandbox/hyperframes/experiment-002/assets/01-gem.mp4`
  - `sandbox/hyperframes/experiment-002/assets/02-jolin.mp4`
  - `sandbox/hyperframes/experiment-002/assets/03-stefanie.mp4`
  - `sandbox/hyperframes/experiment-002/assets/04-amei.mp4`
  - `sandbox/hyperframes/experiment-002/assets/05-faye.mp4`
- Built a no-voiceover HyperFrames composition using muted video layers plus separate same-source audio tracks.
- Rendered sandbox demo to `sandbox/exports/experiment-002/chinese-female-singers-demo.mp4`.
- Generated contact sheet at `sandbox/exports/experiment-002/chinese-female-singers-contact-sheet.jpg`.
- Verified exported file:
  - 1080x1920, 30fps, 38.021s
  - AAC stereo audio, 48000 Hz
  - mean volume `-18.7 dB`, max volume `-1.4 dB`
  - HyperFrames lint `0 errors, 0 warnings`
  - HyperFrames inspect `0 layout issues across 12 samples`
- Note: sandboxed `npx hyperframes ...` could not reach the configured npm mirror; rerunning with local unrestricted permissions succeeded.
