# Run Log: Experiment 022

## 2026-05-16

- Goal: create `陶喆为别人创作的歌TOP5` local preview.
- Ranking rule: user gave 1-5 order; video reveals in reverse order from Top5 to Top1.
- Sources searched with yt-dlp YouTube search using Chrome cookies and Node runtime.
- Created local records:
  - `experiments/experiment-022/source_candidates.md`
  - `data/sources/experiment-022_sources.md`
  - `data/briefs/david-tao-songs-for-others-top5.md`
  - `hyperframes/projects/david-tao-songs-for-others-top5/README.md`
- Downloaded 5 test clips into `sandbox/yt-dlp/clips/experiment-022/`.
- Rendered fast preview via `experiments/experiment-022/render_top5_preview.sh`.

## QA

- Final video: `sandbox/exports/experiment-022/david-tao-songs-for-others-top5-preview.mp4`
- Contact sheet: `sandbox/exports/experiment-022/david-tao-songs-for-others-top5-contact-sheet.jpg`
- ffprobe: 1080x1920, H.264, AAC stereo 48000 Hz, duration 262.45s.
- volumedetect: mean -18.7 dB, max -2.7 dB.
- Contact sheet confirms visible order and no internal workflow wording.

## Notes

- `手牵手` is a historical MV upload, not an official label upload. Keep rights status as `rights_review`.
- `爱什么稀罕` credit metadata varies. The rendered copy uses `词：陶喆/范中芬  曲：陶喆/范中芬` as the broader attribution.

