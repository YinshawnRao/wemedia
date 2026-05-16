# Experiment 024: 林俊杰为别人创作的歌TOP5

方向：用户提供歌曲排名和描述文字。成片按 TOP 视频项目规则倒序揭晓，从 Top5 到 Top1。每段取副歌或主 hook 段，保留素材原声，叠加歌名、演唱者、作词、作曲和一句观众向创作标签。

## User Ranking

| User Rank | Song | Performer | User Description |
|---|---|---|---|
| 1 | 记得 | 张惠妹 | 林俊杰早期最成功的代写情歌之一，阿妹唱成经典，后来林俊杰自己翻唱也很出圈。 |
| 2 | 当你 | 王心凌 | 甜心教主时期的高传唱情歌，旋律简单但特别黏耳，一句“当你的眼睛眯着笑”就是青春开关。 |
| 3 | 心墙 | 郭静 | 副歌传唱度非常高，旋律清亮又有青春感，是后来被反复翻红的代表作。 |
| 4 | 一眼万年 | S.H.E | 古装剧 OST 记忆加成很强，旋律大气又深情，前奏一响就自动切回仙侠滤镜。 |
| 5 | 爱笑的眼睛 | 徐若瑄 | 旋律温柔但记忆点很牢，后来被林俊杰翻唱后又扩大传播。 |

## Edit Order

| Video Rank | Song | Performer | Source Type | Planned Clip | Cut Reason |
|---|---|---|---|---|---|
| Top 5 | 爱笑的眼睛 | 徐若瑄 | Official MV | 00:03:00-00:03:42 | 终段副歌，温柔记忆点和二次传播感集中 |
| Top 4 | 一眼万年 | S.H.E | Official MV | 00:02:55-00:04:05 | 后段副歌，古装 OST 的大气和深情集中 |
| Top 3 | 心墙 | 郭静 | Official MV | 00:02:40-00:03:36 | 终段副歌，清亮青春感和高传唱句集中 |
| Top 2 | 当你 | 王心凌 | Official MV | 00:02:46-00:03:30 | 终段副歌，甜心情歌 hook 集中 |
| Top 1 | 记得 | 张惠妹 | Official MV | 00:03:05-00:04:25 | 终段副歌，阿妹经典情歌爆发和记忆点集中 |

## Credits

| Song | Lyricist | Composer | Evidence |
|---|---|---|---|
| 爱笑的眼睛 | 洪瑞业 | 林俊杰 | FollowLyrics, public lyric metadata |
| 一眼万年 | 姚若龙 | 林俊杰 | 华研国际 YouTube description, FollowLyrics |
| 心墙 | 姚若龙 | 林俊杰 | 福茂唱片 YouTube description, public metadata |
| 当你 | 张思尔 | 林俊杰 | Mulanci, public lyric metadata |
| 记得 | 易家扬 | 林俊杰 | FollowLyrics, public lyric metadata |

## Editorial Rules

- Visible title: `林俊杰为别人创作的歌TOP5`
- Reveal order: `Top5 -> Top4 -> Top3 -> Top2 -> Top1`
- Do not expose internal workflow, project constraints, prompt wording, sandbox wording, or countdown mechanics in visible copy.
- This is a creator/catalog roundup, not a vocal-difficulty video. Visible copy should emphasize song credit, performer, memory point, and songwriting identity.
- Rights status is `rights_review`; this is a local sandbox preview, not a publishing package.

## Output

```text
sandbox/exports/experiment-024/jj-lin-songs-for-others-top5-preview.mp4
sandbox/exports/experiment-024/jj-lin-songs-for-others-top5-contact-sheet.jpg
```

## Result

- Status: rendered local preview.
- Duration: `302.421333s` (`00:05:02`).
- Format: `1080x1920`, H.264, 30 fps, AAC stereo 48 kHz.
- Size: `47M`.
- Audio check: mean volume `-18.9 dB`, max volume `-1.5 dB`.
- Visual check: contact sheet generated and inspected; order is `Top5 -> Top4 -> Top3 -> Top2 -> Top1`.
- Visible copy check: title, rank, performer, lyricist, composer, source label and audience-facing short note only.

## Runtime Notes

- Download path used `--cookies-from-browser chrome --js-runtimes node`.
- All five clips came from official/label YouTube sources and are still marked `rights_review` for publishing.
- Browser-based overlay rendering was blocked by local permission/usage limits during this run, so the preview renderer now uses Pillow PNG overlays plus ffmpeg. This is a safer fallback for local demos when Chrome headless is unavailable.
