# Experiment 023: 周传雄为别人创作的歌TOP5

方向：用户提供歌曲排名和描述文字。成片按 TOP 视频项目规则倒序揭晓，从 Top5 到 Top1。每段取副歌或主 hook 段，保留素材原声，叠加歌名、演唱者、作词、作曲和一句观众向创作标签。

## User Ranking

| User Rank | Song | Performer | User Description |
|---|---|---|---|
| 1 | 有没有一首歌会让你想起我 | 周华健 | 传唱度最高的一首，旋律一响就是集体回忆杀，属于朋友聚会必有人接唱的级别。 |
| 2 | 出卖 | 那英 | 都市情歌里的狠角色，副歌抓耳又带刀，把被背叛后的清醒和崩溃写得特别直接。 |
| 3 | 记事本 | 陈慧琳 | 旋律简单但记忆点极强，苦情不狗血，属于 KTV 年代长线流通的经典女声情歌。 |
| 4 | 我难过 | 5566 | 偶像剧 OST 神曲，副歌一出来就是青春台剧 DNA 启动，传唱度远高于很多人对 5566 的刻板印象。 |
| 5 | 花香 | 许绍洋 | 《薰衣草》主题曲加成很大，旋律清新、画面感强，是早期台偶怀旧代表作。 |

## Edit Order

| Video Rank | Song | Performer | Source Type | Planned Clip | Cut Reason |
|---|---|---|---|---|---|
| Top 5 | 花香 | 许绍洋 | Official MV | 00:03:24-00:04:10 | 终段副歌，台偶画面感和主题句集中 |
| Top 4 | 我难过 | 5566 | Historical MV upload | 00:03:32-00:04:13 | 终段副歌，青春台剧 OST 记忆点集中 |
| Top 3 | 记事本 | 陈慧琳 | Official MV | 00:03:00-00:03:48 | 尾段副歌，苦情女声记忆点集中 |
| Top 2 | 出卖 | 那英 | Official MV | 00:02:20-00:03:28 | 后段连续副歌，抓耳和爆发都更完整 |
| Top 1 | 有没有一首歌会让你想起我 | 周华健 | Official MV | 00:03:03-00:04:28 | 终段大合唱式副歌，集体回忆感最强 |

## Credits

| Song | Lyricist | Composer | Evidence |
|---|---|---|---|
| 花香 | 陈信荣 | 周传雄 | 滚石唱片 YouTube description, Mulanci |
| 我难过 | 陈信荣 | 周传雄 | Historical MV description, Mulanci |
| 记事本 | 周传雄、陈信荣 | 周传雄 | 福茂唱片 YouTube description, Mulanci |
| 出卖 | 林夕 | 周传雄 | Timeless Music YouTube description, Mulanci |
| 有没有一首歌会让你想起我 | 李宗盛、李焯雄 | 周传雄 | 滚石唱片 YouTube description, LRC metadata |

## Editorial Rules

- Visible title: `周传雄为别人创作的歌TOP5`
- Reveal order: `Top5 -> Top4 -> Top3 -> Top2 -> Top1`
- Do not expose internal workflow, project constraints, prompt wording, sandbox wording, or countdown mechanics in visible copy.
- This is a creator/catalog roundup, not a vocal-difficulty video. Visible copy should emphasize song credit, performer, memory point, and songwriting identity.
- Rights status is `rights_review`; this is a local sandbox preview, not a publishing package.

## Output

Generated:

```text
sandbox/exports/experiment-023/steve-chou-songs-for-others-top5-preview.mp4
sandbox/exports/experiment-023/steve-chou-songs-for-others-top5-contact-sheet.jpg
```

## Verification

- Exported on 2026-05-16.
- Video: 1080x1920, H.264, 30fps, duration 298.42s.
- Audio: AAC stereo, 48000 Hz; volumedetect mean -18.8 dB, max -3.6 dB.
- Contact sheet confirms order: intro -> Top5 花香 -> Top4 我难过 -> Top3 记事本 -> Top2 出卖 -> Top1 有没有一首歌会让你想起我 -> closing.
- Visible copy contains song title, performer, lyricist/composer, and audience-facing creation labels. It does not expose internal project constraints or prompt wording.

## Current Judgment

This pass is a usable local preview. The strongest sources are official MVs for `有没有一首歌会让你想起我`, `出卖`, `记事本`, and `花香`. `我难过` uses a historical MV upload because a clearly official full MV source was not found in the first pass.

## Runtime Notes

- Several official sources selected AV1 video streams; downloads succeeded but conversion took longer than older VP9/H.264 sources.
- `有没有一首歌会让你想起我` is a long title, so the rendered text uses a slightly smaller song-title font than the previous template.
