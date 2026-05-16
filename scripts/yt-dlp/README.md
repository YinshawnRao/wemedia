# yt-dlp Helpers

These helpers default to Chrome cookies and Node runtime:

```text
--cookies-from-browser chrome --js-runtimes node
```

During early workflow tests, prefix commands with `WEMEDIA_OUTPUT_MODE=test` to write outputs to `sandbox/yt-dlp/` instead of the formal project directories.

Available helpers:

```bash
./scripts/yt-dlp/env-check.sh
./scripts/yt-dlp/download-video.sh "<YouTube URL>" "<slug>"
./scripts/yt-dlp/download-clip.sh "<YouTube URL>" "<slug>" "00:01:20" "00:02:05"
./scripts/yt-dlp/extract-audio.sh "<YouTube URL>" "<slug>" mp3
./scripts/yt-dlp/download-subtitles.sh "<YouTube URL>" "<slug>"
./scripts/yt-dlp/list-formats.sh "<YouTube URL>"
```

Output directories:

```text
downloads/   full source videos
clips/       downloaded time ranges
audio/       extracted audio
subtitles/   subtitle-only downloads
logs/        archives and run logs
```

See the full usage guide:

```text
docs/YT_DLP_USAGE.md
```
