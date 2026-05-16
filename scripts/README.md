# Scripts

Scripts here are thin helpers for repeatable local work. They should not hide important decisions from the manifests.

Current helpers:

- `yt-dlp/download-video.sh`: download one full YouTube video into `downloads/<slug>/`
- `yt-dlp/download-clip.sh`: download one time range into `clips/<slug>/`
- `yt-dlp/extract-audio.sh`: extract audio into `audio/<slug>/`
- `yt-dlp/download-subtitles.sh`: download subtitles into `subtitles/<slug>/`
- `yt-dlp/list-formats.sh`: inspect available video/audio formats

Before running any download helper, make sure the source is listed in `data/sources/` and the intended clip is listed or planned in `data/clips/`.
