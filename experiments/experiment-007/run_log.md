# Run Log

## 2026-05-10

- Created `experiment-007` for a small Angela Zhang series after `experiment-006` showed the single-singer profile format works.
- Searched additional official MV sources with yt-dlp and Chrome cookies.
- Downloaded 10 longer local sandbox clips, each around 45 seconds.
- Re-encoded all clips into 1080x1920 H.264/AAC assets under `sandbox/hyperframes/experiment-007/assets/`.
- Rendered three fast preview cuts with Chrome PNG overlays and ffmpeg concat:
  - `angela-voice-power-preview.mp4`
  - `angela-inspiration-preview.mp4`
  - `angela-ballad-preview.mp4`
- Generated contact sheets for all three previews.
- Verified all previews have 1080x1920 video and AAC stereo 48000 Hz audio.
- Audio checks:
  - voice power: mean `-18.3 dB`, max `-2.4 dB`
  - inspiration: mean `-18.7 dB`, max `-2.6 dB`
  - ballad: mean `-18.0 dB`, max `-1.4 dB`
