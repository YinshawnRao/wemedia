# yt-dlp Usage

这个项目里已经假定本机安装好了：

- `yt-dlp`
- `ffmpeg`
- `node`

YouTube 解析时默认使用 Chrome cookies 和 Node runtime：

```bash
--cookies-from-browser chrome --js-runtimes node
```

如果 Chrome cookies 不可用，可以临时关闭 cookies 参数：

```bash
YTDLP_COOKIES_BROWSER=none ./scripts/yt-dlp/list-formats.sh "<YouTube URL>"
```

## 环境检查

```bash
./scripts/yt-dlp/env-check.sh
```

## 测试模式

项目初期建议先用测试模式跑通流程。测试模式会把下载、切片、音频、字幕和日志全部写到 `sandbox/yt-dlp/`，不污染正式素材目录：

```bash
WEMEDIA_OUTPUT_MODE=test ./scripts/yt-dlp/env-check.sh
WEMEDIA_OUTPUT_MODE=test ./scripts/yt-dlp/download-video.sh "<YouTube URL>" "<slug>"
WEMEDIA_OUTPUT_MODE=test ./scripts/yt-dlp/download-clip.sh "<YouTube URL>" "<slug>" "00:01:20" "00:02:05"
```

确认流程稳定后，去掉 `WEMEDIA_OUTPUT_MODE=test` 就会写入正式目录。

## 完整视频

保存到 `downloads/<slug>/`，默认合并为 MP4，并写入元数据、缩略图、字幕和下载归档：

```bash
./scripts/yt-dlp/download-video.sh "<YouTube URL>" "<slug>"
```

## 指定时间片段

保存到 `clips/<slug>/`：

```bash
./scripts/yt-dlp/download-clip.sh "<YouTube URL>" "<slug>" "00:01:20" "00:02:05"
```

切片不使用 yt-dlp 的 `--download-archive`，因为同一个视频可能需要多个不同时间段。切片记录会写入 `logs/clip-runs.tsv`。

## 提取音频

保存到 `audio/<slug>/`，默认 MP3：

```bash
./scripts/yt-dlp/extract-audio.sh "<YouTube URL>" "<slug>"
```

指定格式：

```bash
./scripts/yt-dlp/extract-audio.sh "<YouTube URL>" "<slug>" wav
```

## 下载字幕

保存到 `subtitles/<slug>/`：

```bash
./scripts/yt-dlp/download-subtitles.sh "<YouTube URL>" "<slug>"
```

默认字幕语言：

```text
en,zh-Hans,zh-Hant
```

临时覆盖：

```bash
YTDLP_SUB_LANGS="en.*,zh.*" ./scripts/yt-dlp/download-subtitles.sh "<YouTube URL>" "<slug>"
```

## 查看格式

```bash
./scripts/yt-dlp/list-formats.sh "<YouTube URL>"
```

## 文件命名

默认命名包含：

```text
上传日期_频道名_标题_视频ID
```

切片额外包含：

```text
clip_开始时间_结束时间
```

## 日志和去重

- 完整视频归档：`logs/downloads-archive.txt`
- 音频归档：`logs/audio-archive.txt`
- 字幕归档：`logs/subtitles-archive.txt`
- 脚本运行记录：`logs/yt-dlp-runs.tsv`
- 切片记录：`logs/clip-runs.tsv`

这些日志默认不进入 git。

## 版权提醒

不要把“能下载”当成“能发布”。公开视频、YouTube 视频和创作者内容在商用、搬运、二创、评论引用时都有不同风险。用于最终发布前，请确认 YouTube 条款、原作者授权、平台规则，以及你的使用场景是否成立。
