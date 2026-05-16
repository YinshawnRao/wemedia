# Prompt: yt-dlp Download Plan

请根据来源清单，生成一个安全、可复核的 `yt-dlp` 下载计划。不要直接下载，先列计划。

输入：

```text
<粘贴 source manifest 或候选 URL>
```

输出每条下载任务：

- source_id
- URL
- slug
- start
- end
- 用途
- 保存目录
- 预计命令
- 授权/风险状态
- 是否需要用户确认

命令模板：

```bash
WEMEDIA_OUTPUT_MODE=test ./scripts/yt-dlp/download-clip.sh "<url>" "<slug>" "<start>" "<end>"
./scripts/yt-dlp/download-clip.sh "<url>" "<slug>" "<start>" "<end>"
./scripts/yt-dlp/download-video.sh "<url>" "<slug>"
./scripts/yt-dlp/extract-audio.sh "<url>" "<slug>"
./scripts/yt-dlp/download-subtitles.sh "<url>" "<slug>"
```

约束：

- 优先下载最小可用片段，不默认下载完整视频。
- 项目初期试跑默认使用 `WEMEDIA_OUTPUT_MODE=test`，确认后再写正式目录。
- 保留 info json、字幕、缩略图。
- 授权不明确的内容只能进入 review，不进入 final edit。
- 不处理需要绕过访问控制的链接。
