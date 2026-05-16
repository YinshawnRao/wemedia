# Run Log: Experiment 028

## 2026-05-16

- Created source candidates and brief for `华语live翻车名场面TOP5`.
- Used the ranking in reverse reveal order: Top5 `李玟`, Top4 `戴佩妮`, Top3 `王菲、陈奕迅`, Top2 `萨顶顶`, Top1 `飞轮海`.
- Downloaded five representative live/news clips into `sandbox/yt-dlp/clips/experiment-028/` using Chrome cookies and Node runtime.
- First batch failed only on李玟 `ThR4kOGHYpI` because YouTube DNS resolution temporarily failed.
- Retried李玟 as a single clip and downloaded successfully without changing source or cut point.
- Rendered a local vertical preview with `scripts/video/pillow_top5_renderer.py`.

## QA

- Export: `sandbox/exports/experiment-028/mandopop-live-oops-top5-preview.mp4`
- Contact sheet: `sandbox/exports/experiment-028/mandopop-live-oops-top5-contact-sheet.jpg`
- Video: H.264, 1080x1920, 30fps, 170.087667s.
- Audio: AAC stereo, 48 kHz, mean -18.6 dB, max -1.4 dB.
- Syntax check passed with `PYTHONPYCACHEPREFIX=/Users/yinshawnrao/explorer/wemedia/sandbox/pycache`.
- Visible copy check passed for the render script; no project/prompt/internal wording or insulting keywords are present in viewer-facing text.

## Notes

- Rights status remains `rights_review`; this is a local experimental preview.
- This topic intentionally uses gentle framing: `意外`, `救场`, `互动翻车`, `话筒乌龙`, `真唱考古`.
- Some sources are news or user uploads rather than full official stage footage; they are suitable for local concept testing but should be reviewed before any publishing workflow.
