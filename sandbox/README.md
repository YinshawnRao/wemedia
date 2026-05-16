# Sandbox

这个目录只放测试流程的临时产物。项目初期先在这里跑通下载、切片、字幕、音频和 HyperFrames 试验，确认流程稳定后再写入正式目录。

## yt-dlp 测试输出

使用：

```bash
WEMEDIA_OUTPUT_MODE=test ./scripts/yt-dlp/download-video.sh "<YouTube URL>" "<slug>"
WEMEDIA_OUTPUT_MODE=test ./scripts/yt-dlp/download-clip.sh "<YouTube URL>" "<slug>" "00:01:20" "00:02:05"
WEMEDIA_OUTPUT_MODE=test ./scripts/yt-dlp/extract-audio.sh "<YouTube URL>" "<slug>"
WEMEDIA_OUTPUT_MODE=test ./scripts/yt-dlp/download-subtitles.sh "<YouTube URL>" "<slug>"
```

输出位置：

```text
sandbox/yt-dlp/downloads/
sandbox/yt-dlp/clips/
sandbox/yt-dlp/audio/
sandbox/yt-dlp/subtitles/
sandbox/yt-dlp/logs/
```

## HyperFrames 测试

临时试验项目可以放在：

```text
sandbox/hyperframes/
```

测试导出可以放在：

```text
sandbox/exports/
```

这里的产物默认不进 git；保留 README 和 `.gitkeep` 只是为了固定目录结构。

