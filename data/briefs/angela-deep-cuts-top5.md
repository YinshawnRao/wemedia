# Brief: 张韶涵冷门歌曲 TOP5

Experiment: `experiment-012`

## Goal

制作一条本地实验版竖屏音乐盘点视频：张韶涵冷门歌曲 TOP5，由用户提供排名。成片按倒序揭晓，从 Top5 到 Top1，每首歌保留经典副歌片段和原曲声音。

## Audience

张韶涵粉丝、华语音乐听众、喜欢“宝藏冷门歌”盘点的短视频观众。重点不是演唱难度，而是“懂歌单的人会会心一笑”的冷门回忆感。

## Format

- Canvas: 9:16 vertical, 1080x1920
- Structure: intro 5s + 5 clips around 40-46s each + closing 5s
- Ranking: countdown, `Top5 -> Top1`
- Voiceover: none
- Audio: source music audio only
- Overlay text: rank, song title, lyricist, composer, source label
- Style source: `DESIGN.md`

## Edit Order

| Video Rank | Song | Lyricist | Composer | Clip |
|---|---|---|---|---|
| Top 5 | 失忆 | 林隆璇 | 林隆璇 | 00:03:55-00:04:38 |
| Top 4 | 幻想爱 | 陈伟 | 陈伟 | 00:02:42-00:03:25 |
| Top 3 | 城市之窗 | 王雅君 / 陈瑶 | 王雅君 | 00:03:09-00:03:55 |
| Top 2 | 绝不 | 深白色 | 深白色 | 00:02:54-00:03:34 |
| Top 1 | 伤日快乐 | 王雅君 | 王雅君 | 00:03:28-00:04:08 |

## Editorial Caution

Rights status remains `rights_review`. This is a local experiment. Do not treat the resulting file as cleared for commercial publishing.

## Current Output

```text
sandbox/exports/experiment-012/angela-deep-cuts-top5-preview.mp4
sandbox/exports/experiment-012/angela-deep-cuts-top5-contact-sheet.jpg
```

## QA Notes

- Duration: about 3:42
- Output: 1080x1920, 30fps, H.264 + AAC stereo
- Audio: source music retained and normalized; no voiceover
- Countdown rule confirmed in final edit: `Top5 -> Top4 -> Top3 -> Top2 -> Top1`
- Visual check: sampled frames show readable song title and 作词/作曲 metadata.
- Title copy corrected to `张韶涵冷门歌曲 TOP5`; countdown is an internal narrative rule, not visible title language.
