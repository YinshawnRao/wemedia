# Experiment 006 Download Plan

Mode: `WEMEDIA_OUTPUT_MODE=test`

All downloads are for local sandbox testing only. Use Chrome cookies and Node runtime for YouTube:

```text
--cookies-from-browser chrome --js-runtimes node
```

## Sources

| # | Song | URL | Range | Purpose | Local Output |
|---|---|---|---|---|---|
| 1 | 欧若拉 | https://www.youtube.com/watch?v=dmwJaG-R1iM | `00:00:57-00:01:23` | 早期辨识度 | `sandbox/yt-dlp/clips/experiment-006/20120203___Angela_Zhang_-_MV_dmwJaG-R1iM_clip_00-00-57_00-01-23.mp4` |
| 2 | 隐形的翅膀 | https://www.youtube.com/watch?v=be2wvNFTLMc | `00:00:58-00:01:24` | 穿透型高音 | `sandbox/yt-dlp/clips/experiment-006/20120203___Angela_Zhang_-_MV_be2wvNFTLMc_clip_00-00-58_00-01-24.mp4` |
| 3 | 亲爱的那不是爱情 | https://www.youtube.com/watch?v=HwF1i_6Iwp8 | `00:01:09-00:01:35` | 情歌叙事 | `sandbox/yt-dlp/clips/experiment-006/20090325___Angela_Zhang_-_MV_HwF1i_6Iwp8_clip_00-01-09_00-01-35.mp4` |
| 4 | 遗失的美好 | https://www.youtube.com/watch?v=sh4BwEDtRI0 | `00:01:11-00:01:37` | 遗憾感 | `sandbox/yt-dlp/clips/experiment-006/20120203___Angela_Zhang_-_MV_sh4BwEDtRI0_clip_00-01-11_00-01-37.mp4` |
| 5 | 淋雨一直走 | https://www.youtube.com/watch?v=WTcodZDH-Oc | `00:00:52-00:01:18` | 后期能量 | `sandbox/yt-dlp/clips/experiment-006/20121015_Angela_Zhang_Angela_-_HD_MV_Keep_Walking_Official_HD_MV_WTcodZDH-Oc_clip_00-00-52_00-01-18.mp4` |

## Processed Assets

The raw clips are re-encoded to HyperFrames-friendly 1080x1920 H.264/AAC assets:

```text
sandbox/hyperframes/experiment-006/assets/01-aurora.mp4
sandbox/hyperframes/experiment-006/assets/02-wings.mp4
sandbox/hyperframes/experiment-006/assets/03-not-love.mp4
sandbox/hyperframes/experiment-006/assets/04-lost-beauty.mp4
sandbox/hyperframes/experiment-006/assets/05-keep-walking.mp4
```

## Rights

These clips remain `rights_review`. They are useful for local workflow validation, but not automatically cleared for public or commercial publishing.
