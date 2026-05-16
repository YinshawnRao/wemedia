# Run Log: Experiment 023

## 2026-05-16

- Goal: create `周传雄为别人创作的歌TOP5` local preview.
- Ranking rule: user gave 1-5 order; video reveals in reverse order from Top5 to Top1.
- Sources searched with yt-dlp YouTube search using Chrome cookies and Node runtime.
- Created local records:
  - `experiments/experiment-023/source_candidates.md`
  - `data/sources/experiment-023_sources.md`
  - `data/briefs/steve-chou-songs-for-others-top5.md`
  - `hyperframes/projects/steve-chou-songs-for-others-top5/README.md`
- Downloaded 5 test clips into `sandbox/yt-dlp/clips/experiment-023/`.
- Rendered fast preview via `experiments/experiment-023/render_top5_preview.sh`.

## QA

- Final video: `sandbox/exports/experiment-023/steve-chou-songs-for-others-top5-preview.mp4`
- Contact sheet: `sandbox/exports/experiment-023/steve-chou-songs-for-others-top5-contact-sheet.jpg`
- ffprobe: 1080x1920, H.264, AAC stereo 48000 Hz, duration 298.42s.
- volumedetect: mean -18.8 dB, max -3.6 dB.
- Contact sheet confirms visible order and no internal workflow wording.

## Notes

- `我难过` uses a historical MV upload and remains `rights_review`.
- `记事本` credit is `作词：周传雄、陈信荣 / 作曲：周传雄`; do not simplify it to only 陈信荣.

