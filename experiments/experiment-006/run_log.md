# Run Log

## 2026-05-10

- Created a clean `experiment-006` for the Angela Zhang single-singer special after discovering `experiment-004` and `experiment-005` were already used by other tests.
- User expressed preference for 张韶涵 and asked whether a single-singer special is feasible.
- Decided to test a 5-chapter singer profile instead of another horizontal roundup.
- Confirmed five YouTube sources with yt-dlp and Chrome cookies.
- Downloaded five 26-second sandbox clips.
- Re-encoded the clips into 1080x1920 H.264/AAC assets under `sandbox/hyperframes/experiment-006/assets/`.
- Created HyperFrames source project at `sandbox/hyperframes/experiment-006/index.html`.
- HyperFrames lint passed with 0 errors and 0 warnings.
- HyperFrames inspect passed with 0 layout issues across 12 samples.
- Rendered fast local preview through Chrome PNG overlays and ffmpeg concat.
- Output: `sandbox/exports/experiment-006/angela-zhang-special-preview.mp4`.
- Verification: 1080x1920, 30 fps, AAC stereo 48000 Hz, 139.521333 seconds, mean volume `-18.5 dB`, max volume `-2.3 dB`.
