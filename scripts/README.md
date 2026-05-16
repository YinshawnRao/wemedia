# Scripts

Scripts here are thin helpers for repeatable local work. They should not hide important decisions from the manifests.

Current helpers:

- `yt-dlp/download-video.sh`: download one full YouTube video into `downloads/<slug>/`
- `yt-dlp/download-clip.sh`: download one time range into `clips/<slug>/`
- `yt-dlp/extract-audio.sh`: extract audio into `audio/<slug>/`
- `yt-dlp/download-subtitles.sh`: download subtitles into `subtitles/<slug>/`
- `yt-dlp/list-formats.sh`: inspect available video/audio formats
- `tts/render-default-voiceover.sh`: render the project-default Kokoro narration voice selected from `tts-local-benchmark`
- `tts/add-voiceover.sh`: mix a generated voiceover into an MP4, ducking existing source audio when present
- `tts/voiceover-video.sh`: one-step wrapper that renders the default voice and mixes it into a video

Before running any download helper, make sure the source is listed in `data/sources/` and the intended clip is listed or planned in `data/clips/`.

For narration requests, use only the current default voice profile in `config/tts/default-voiceover.json`. The old ONNX Kokoro helper has been removed to avoid accidental use.
