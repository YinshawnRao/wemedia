# Experiment 025: Tank吕建忠为别人创作的歌TOP5

方向：用户提供歌曲排名和描述文字。成片按 TOP 视频项目规则倒序揭晓，从 Top5 到 Top1。每段取副歌或主 hook 段，保留素材原声，叠加歌名、演唱者、作词、作曲和一句观众向创作标签。

## User Ranking

| User Rank | Song | Performer | User Description |
|---|---|---|---|
| 1 | 非你莫属 | 林依晨 | 偶像剧 OST 记忆太强，副歌一出来就是青春滤镜，后来 Tank 自己版本也继续唱红。 |
| 2 | 不作你的朋友 | S.H.E | S.H.E 中期代表性抒情 R&B，旋律顺、情绪准，是“朋友以上恋人未满”题材经典款。 |
| 3 | 我有我的Young | 飞轮海 | 飞轮海出道期标志性歌曲，广告感、团体感和年代感拉满。 |
| 4 | 夏雪 | 飞轮海 | 歌名和副歌记忆点强，少年感、偶像剧感、苦甜感全在。 |
| 5 | 天亮以后 | 胡歌 | 《天外飞仙》OST 加成明显，旋律古早又深情，适合台偶/古偶回忆杀。 |

## Edit Order

| Video Rank | Song | Performer | Source Type | Planned Clip | Cut Reason |
|---|---|---|---|---|---|
| Top 5 | 天亮以后 | 胡歌 | Official MV | 00:02:49-00:03:58 | 后段副歌，古偶 OST 的深情和告别感集中 |
| Top 4 | 夏雪 | 飞轮海 | Official MV | 00:02:55-00:03:55 | 后段副歌，少年苦甜感和歌名记忆点集中 |
| Top 3 | 我有我的Young | 飞轮海 | Official MV | 00:03:13-00:04:12 | 后段主 hook，团体感、广告感和年代感集中 |
| Top 2 | 不作你的朋友 | S.H.E | Official MV | 00:03:13-00:04:18 | 后段副歌，朋友以上恋人未满的情绪集中 |
| Top 1 | 非你莫属 | 林依晨 | Official MV | 00:03:10-00:04:20 | 终段副歌，青春 OST 滤镜和代表旋律集中 |

## Credits

| Song | Lyricist | Composer | Evidence |
|---|---|---|---|
| 天亮以后 | Tank | Tank | 华研国际 YouTube description |
| 夏雪 | 陈信延 | Tank | 华研国际 YouTube description |
| 我有我的Young | 陈信延 | Tank | 华研国际 YouTube description |
| 不作你的朋友 | 葛大为 | Tank | public encyclopedia metadata |
| 非你莫属 | 陈信延 | Tank | 华研国际 YouTube description |

## Editorial Rules

- Visible title: `Tank吕建忠为别人创作的歌TOP5`
- Reveal order: `Top5 -> Top4 -> Top3 -> Top2 -> Top1`
- Visible copy must stay audience-facing: song, performer, lyricist, composer, source label and short memory point.
- This is a creator/catalog roundup, not a vocal-difficulty video.
- Rights status is `rights_review`; this is a local sandbox preview, not a publishing package.

## Output

```text
sandbox/exports/experiment-025/tank-songs-for-others-top5-preview.mp4
sandbox/exports/experiment-025/tank-songs-for-others-top5-contact-sheet.jpg
```

## Result

- Status: rendered local preview.
- Duration: `333.521333s` (`00:05:33`).
- Format: `1080x1920`, H.264, 30 fps, AAC stereo 48 kHz.
- Size: `65M`.
- Audio check: mean volume `-18.8 dB`, max volume `-2.0 dB`.
- Visual check: contact sheet generated and inspected; order is `Top5 -> Top4 -> Top3 -> Top2 -> Top1`.
- Visible copy check: title, rank, performer, lyricist, composer, source label and audience-facing short note only.

## Runtime Notes

- Download path used `--cookies-from-browser chrome --js-runtimes node`.
- All five clips came from 華研國際 official YouTube sources and are still marked `rights_review` for publishing.
- This run uses the reusable Pillow + ffmpeg renderer in `scripts/video/pillow_top5_renderer.py`.
