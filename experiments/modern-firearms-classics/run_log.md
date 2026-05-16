# Run Log

## 2026-05-13

- User requested a local test video: “现代战争最经典的枪械武器 TOP5”.
- User clarified the video is local test only and not commercial, so source risk can be handled pragmatically.
- Read `DESIGN.md`; visual direction is documentary/editorial, dark charcoal canvas, warm paper surfaces, red-orange signal, teal source labels, warm yellow timestamps.
- Chose theme slug `modern-firearms-classics` to avoid numeric experiment/export directories.
- Selected DVIDS public-domain candidate clips for M107, M249, M240B, M4, and AK-47.
- Confirmed `yt-dlp` version is available after sandbox escalation: `2026.03.17`.
- Confirmed `yt-dlp --get-url` can resolve the AK-47 DVIDS page to a CloudFront HLS media URL, so DVIDS pages are usable through the project yt-dlp flow.
- Downloaded five initial test clips into `sandbox/yt-dlp/clips/`.
- Visual contact sheets showed the initial M249, M4, and AK-47 pulls were weaker than desired; replaced M249 with `M249 range b-roll`, replaced M4 with `B-Roll: Soldiers train on the M4 carbine and M320 grenade launcher during E2B`, and re-pulled the later AK-47 range.
- Copied selected clips into `hyperframes/projects/modern-firearms-classics/assets/` and re-encoded project assets to 30fps H.264/AAC with short GOP (`*-edit.mp4`) before final render.
- Built HyperFrames vertical composition at `hyperframes/projects/modern-firearms-classics/index.html`; duration is 70 seconds, 1080x1920, with five firearm segments and a persistent right-top note: `纯科普视频｜不构成购买、改装或使用建议`.
- HyperFrames lint result: 0 errors, 0 warnings.
- HyperFrames inspect result: 0 layout issues across 12 timeline samples.
- Rendered final MP4 to `sandbox/exports/modern-firearms-classics/modern-firearms-classics.mp4`.
- Final ffprobe: 1080x1920, 30fps, AAC audio, 70.021 seconds, about 45.6 MB.
- Final contact sheet saved to `sandbox/exports/modern-firearms-classics/final-contact-sheet.jpg`; every segment has the named firearm visible, and the legal/educational note is visible in the sampled frames.
