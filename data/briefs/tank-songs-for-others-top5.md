# Brief: Tank吕建忠为别人创作的歌TOP5

Experiment: `experiment-025`

## Goal

制作一条竖屏音乐盘点 demo，标题为 `Tank吕建忠为别人创作的歌TOP5`。用户提供正序排名，成片倒序揭晓，从 Top5 到 Top1。每段取副歌或主 hook 段，保留原曲声音，每首歌标明演唱者、作词、作曲。

## Audience

面向华语流行听众、Tank 歌迷、台偶/古偶 OST 记忆讨论人群。文字要像观众向音乐盘点，不出现任何项目约束、提示词、素材下载流程或内部目录信息。

## Structure

| Order | Visible Rank | Song | Performer | Visible Label | Clip |
|---|---|---|---|---|---|
| 1 | Top 5 | 天亮以后 | 胡歌 | 古偶深情补刀 | 00:02:49-00:03:58 |
| 2 | Top 4 | 夏雪 | 飞轮海 | 少年苦甜副歌 | 00:02:55-00:03:55 |
| 3 | Top 3 | 我有我的Young | 飞轮海 | 台偶团体名片 | 00:03:13-00:04:12 |
| 4 | Top 2 | 不作你的朋友 | S.H.E | 朋友以上恋人未满 | 00:03:13-00:04:18 |
| 5 | Top 1 | 非你莫属 | 林依晨 | 青春OST滤镜 | 00:03:10-00:04:20 |

## Visual Direction

- 9:16 vertical, 1080x1920.
- Use `DESIGN.md` palette: dark graphite background, warm cream text, red/teal/gold accents.
- Keep source video centered with blurred background fill.
- Text overlay should be compact: rank, song title, performer, word/music credits, one short memory label, source label.
- No TTS for this pass. The source audio is the main listening object.

## Visible Copy Draft

Intro:

```text
Tank吕建忠为别人创作的
歌TOP5
台偶、古偶、青春团体和 R&B 情歌的回忆线。
这些副歌，都是一秒回到偶像剧年代。
```

Closing:

```text
Tank写给别人的歌
也是台偶黄金时代的声纹
旋律很直接，情绪也很会命中记忆点。
哪一首最有青春滤镜？
```

## Output

```text
sandbox/exports/experiment-025/tank-songs-for-others-top5-preview.mp4
sandbox/exports/experiment-025/tank-songs-for-others-top5-contact-sheet.jpg
```

## QA Result

- Structure check: passed, order is `Top5 -> Top4 -> Top3 -> Top2 -> Top1`.
- Text check: passed, every song has performer, lyricist and composer in the visible lower third.
- Visual check: passed, contact sheet generated and inspected.
- Export check: passed, MP4 is `1080x1920`, H.264, 30 fps, AAC stereo 48 kHz, duration `333.521333s`.
- Audio check: passed, mean volume `-18.8 dB`, max volume `-2.0 dB`.
