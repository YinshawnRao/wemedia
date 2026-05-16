# Experiment 022: 陶喆为别人创作的歌TOP5

方向：用户提供歌曲排名和描述文字。成片按 TOP 视频项目规则倒序揭晓，从 Top5 到 Top1。每段取副歌或主 hook 段，保留素材原声，叠加歌名、演唱者、作词、作曲和一句观众向创作标签。

## User Ranking

| User Rank | Song | Performer | User Description |
|---|---|---|---|
| 1 | 算你狠 | 陈小春 | 陶喆写给陈小春最出圈的一首，把 R&B、复古采样和痞气人设揉在一起，传唱度和辨识度都很高。 |
| 2 | 爱什么稀罕 | 张惠妹 | 阿妹早期最有攻击性的快歌之一，陶喆式律动很明显，副歌一出来就是洒脱分手宣言。 |
| 3 | 手牵手 | 群星 | SARS 时期公益大合唱，王力宏、陶喆共同创作制作，知名度更多来自时代记忆和群星阵容。 |
| 4 | 好心情 Just Be Yourself | S.H.E | 甜快轻巧、广告感强，陶喆把 R&B 律动写得很少女团。 |
| 5 | 我都知道 | 梁静茹 | 不是最大众爆款，但在梁静茹歌迷里辨识度很高，陶喆给她写出了少见的轻 R&B 侧面。 |

## Edit Order

| Video Rank | Song | Performer | Source Type | Planned Clip | Cut Reason |
|---|---|---|---|---|---|
| Top 5 | 我都知道 | 梁静茹 | Official MV | 00:03:00-00:03:38 | 终段副歌，轻 R&B 旋律和人声记忆点集中 |
| Top 4 | 好心情 Just Be Yourself | S.H.E | Official MV | 00:01:58-00:02:40 | 第二段连续副歌，甜快律动更完整 |
| Top 3 | 手牵手 | 群星 | Historical MV upload | 00:03:42-00:04:52 | 后段合唱副歌，时代记忆和群星能量集中 |
| Top 2 | 爱什么稀罕 | 张惠妹 | YouTube Topic audio | 00:02:36-00:03:22 | 终段副歌，快歌攻击性和分手宣言集中 |
| Top 1 | 算你狠 | 陈小春 | Official MV | 00:00:39-00:01:35 | 首段主 hook，歌名句和痞气 R&B 辨识度最直接 |

## Credits

| Song | Lyricist | Composer | Evidence |
|---|---|---|---|
| 我都知道 | 姚若龙 | 陶喆 | 滚石唱片 YouTube description, Mulanci |
| 好心情 Just Be Yourself | 娃娃 | 陶喆 | 华研国际 YouTube description, Mulanci |
| 手牵手 | 王力宏、陶喆、陈镇川 | 王力宏、陶喆 | YouTube description, Wikipedia/CNA summaries |
| 爱什么稀罕 | 陶喆、范中芬 | 陶喆、范中芬 | Album track listing and public lyric/metadata sources |
| 算你狠 | 陶喆、郑中庸、蔡振南 | 陶喆、蔡振南 | JordanChanVEVO YouTube description, MusicBrainz/Mulanci |

## Editorial Rules

- Visible title: `陶喆为别人创作的歌TOP5`
- Reveal order: `Top5 -> Top4 -> Top3 -> Top2 -> Top1`
- Do not expose internal workflow, project constraints, prompt wording, sandbox wording, or countdown mechanics in visible copy.
- This is a creator/catalog roundup, not a vocal-difficulty video. Visible copy should emphasize song credit, performer, groove, memory point, and production identity.
- Rights status is `rights_review`; this is a local sandbox preview, not a publishing package.

## Output

Generated:

```text
sandbox/exports/experiment-022/david-tao-songs-for-others-top5-preview.mp4
sandbox/exports/experiment-022/david-tao-songs-for-others-top5-contact-sheet.jpg
```

## Verification

- Exported on 2026-05-16.
- Video: 1080x1920, H.264, 30fps, duration 262.45s.
- Audio: AAC stereo, 48000 Hz; volumedetect mean -18.7 dB, max -2.7 dB.
- Contact sheet confirms order: intro -> Top5 我都知道 -> Top4 好心情 Just Be Yourself -> Top3 手牵手 -> Top2 爱什么稀罕 -> Top1 算你狠 -> closing.
- Visible copy contains song title, performer, lyricist/composer, and audience-facing creation labels. It does not expose internal project constraints or prompt wording.

## Current Judgment

This pass is a usable local preview. The strongest sources are the official MVs for `算你狠`, `好心情 Just Be Yourself`, and `我都知道`. `爱什么稀罕` uses YouTube Topic audio, and `手牵手` uses a historical MV upload because a clearly official 2003 MV source was not found in the first pass.

## Runtime Notes

- `算你狠` selected an AV1 video stream and took longer to transcode than the other segments.
- `爱什么稀罕` public credits vary across sources. The visible copy uses the broader co-credit form `陶喆/范中芬` for both words and music to avoid omitting a credited writer.
