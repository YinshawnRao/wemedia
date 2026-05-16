# Cookies

这个目录用于放手动导出的 cookies 文件，例如：

```text
secrets/cookies/youtube.txt
```

使用方式：

```bash
YTDLP_COOKIES_FILE=secrets/cookies/youtube.txt ./scripts/yt-dlp/list-formats.sh "<YouTube URL>"
```

注意：

- cookies 文件包含账号登录凭据，不要提交到 git。
- 建议只为测试下载使用，过期后重新导出。
- 如果 `--cookies-from-browser chrome` 能正常工作，就不需要这个文件。

