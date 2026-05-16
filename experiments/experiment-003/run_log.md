# Run Log

## 2026-05-10

- Created experiment folder.
- Set concept: 华语女声 10 个副歌瞬间.
- User feedback from previous version: clips were visually good but too short; some choruses ended before they landed.
- Selected 10 singers and target 27-second chorus/hook windows.
- All sources are marked `rights_review` and kept in sandbox workflow.
- Downloaded all 10 YouTube test excerpts with Chrome cookies and Node runtime into `sandbox/yt-dlp/clips/experiment-003/`.
- Re-encoded all 10 excerpts into vertical HyperFrames-friendly assets under `sandbox/hyperframes/experiment-003/assets/`.
- Built the long HyperFrames composition at `sandbox/hyperframes/experiment-003/index.html`.
- HyperFrames checks passed:
  - lint: `0 errors, 0 warnings`
  - inspect: `0 layout issues across 16 samples`
- Attempted HyperFrames render to `sandbox/exports/experiment-003/chinese-female-singers-long-chorus-demo.mp4`; stopped it because long-form frame capture was too slow after HyperFrames reduced to one worker.
- Created fast preview export path with `experiments/experiment-003/render_ffmpeg_preview.sh`:
  - Chrome headless renders SVG text overlays to transparent PNG.
  - ffmpeg overlays PNG labels on the 10 vertical MP4 assets.
  - ffmpeg concatenates intro, 10 singer segments, and closing.
- Exported final local preview:
  - `sandbox/exports/experiment-003/chinese-female-singers-long-chorus-preview.mp4`
  - `sandbox/exports/experiment-003/chinese-female-singers-long-chorus-contact-sheet.jpg`
- Verified final preview:
  - 1080x1920, 30fps, 280.021s
  - AAC stereo, 48000 Hz
  - mean volume `-18.4 dB`, max volume `-1.1 dB`

## 2026-05-10 Technical Notes

- This ffmpeg build does not include the `drawtext` filter.
- This ffmpeg build also cannot decode SVG directly as a video input.
- Workaround: render text overlays from SVG to PNG with Chrome headless, then overlay PNGs with ffmpeg.
- For long music roundup previews, this is faster than HyperFrames full frame capture.

## 2026-05-10 Ten Sandbox Shorts

- Built a separate 10-short public-source test run in `sandbox/hyperframes/experiment-003/<slug>/`.
- Original YouTube-first research path was blocked by unauthenticated bot verification; browser-cookie access was not used for the final outputs.
- Switched to public direct media from FedFlix, NOAA Ocean Exploration, and CDC Stacks.
- Created 10 source-audio shorts: space engineering, ocean exploration, volcano geology, public health, public-record history, food safety, wildlife refuge, aviation, dam safety, and aquaculture.
- Re-encoded all source clips to 30fps H.264/AAC with short keyframes for stable HyperFrames rendering.
- HyperFrames lint passed for all 10 projects with 0 errors and 0 warnings.
- HyperFrames visual inspect passed for all 10 projects with 0 layout issues across 5 samples each.
- Draft exports completed for all 10 videos under `sandbox/exports/experiment-003/`.
