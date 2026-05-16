# Run Log

## 2026-05-10

- Created experiment folder.
- Selected fun science as first direction.
- Recommended topic: space flame shape in microgravity.
- Added initial source candidates from NASA and NASA Video.
- Ran format-check smoke test:

```bash
WEMEDIA_OUTPUT_MODE=test ./scripts/yt-dlp/list-formats.sh "https://www.youtube.com/watch?v=d0FAgKZU880"
```

Result: failed before format listing. Chrome cookies were found but could not be decrypted in the execution environment, and YouTube returned bot verification.

Cause: user accidentally rejected Chrome permission.

Retry:

```bash
WEMEDIA_OUTPUT_MODE=test ./scripts/yt-dlp/list-formats.sh "https://www.youtube.com/watch?v=d0FAgKZU880"
```

Result: succeeded after permission was allowed. yt-dlp extracted 1728 cookies, used Node to solve YouTube JS challenges, and listed formats.

Downloaded first test clip:

```bash
WEMEDIA_OUTPUT_MODE=test ./scripts/yt-dlp/download-clip.sh "https://www.youtube.com/watch?v=d0FAgKZU880" "experiment-001" "00:00:00" "00:00:12"
```

Result: succeeded. Actual MP4 duration is about 8.008 seconds because the source video is only about 8 seconds long.

Output:

```text
sandbox/yt-dlp/clips/experiment-001/20130522_NASA_Video_Flame_in_Reduced_Gravity_d0FAgKZU880_clip_00-00-00_00-00-12.mp4
```

- Initialized HyperFrames project in `sandbox/hyperframes/experiment-001/`.
- Created a 40-second vertical demo.
- Re-encoded source clip to reduce keyframe seek risk.
- Rendered draft MP4:

```text
sandbox/exports/experiment-001/space-flame-demo.mp4
```

- Created contact sheet:

```text
sandbox/exports/experiment-001/space-flame-demo-contact-sheet.jpg
```

- Checks passed: lint 0/0, inspect 0 layout issues, ffprobe valid.

- User noticed the first demo had no voiceover.
- Attempted Noiz timeline TTS; failed with service-side 500 response on segment 1.
- Used macOS local `say` with `Tingting` voice to generate five narration segments.
- Mixed segments into:

```text
sandbox/hyperframes/experiment-001/assets/narration.wav
```

- Added narration as a separate HyperFrames audio track.
- Rendered voiceover version:

```text
sandbox/exports/experiment-001/space-flame-demo-voiceover.mp4
```

- Checks passed after voiceover: lint 0/0, inspect 0 layout issues, ffprobe valid 1080x1920 MP4 with AAC audio.
