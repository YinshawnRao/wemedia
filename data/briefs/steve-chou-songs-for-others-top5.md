# Brief: 周传雄为别人创作的歌TOP5

Experiment: `experiment-023`

## Goal

制作一条竖屏音乐盘点 demo，标题为 `周传雄为别人创作的歌TOP5`。用户提供正序排名，成片倒序揭晓，从 Top5 到 Top1。每段取副歌或主 hook 段，保留原曲声音，每首歌标明演唱者、作词、作曲。

## Audience

面向华语流行听众、周传雄歌迷、KTV 年代情歌和台偶 OST 记忆讨论人群。文字要像观众向音乐盘点，不出现任何项目约束、提示词、素材下载流程或内部目录信息。

## Structure

| Order | Visible Rank | Song | Performer | Visible Label | Clip |
|---|---|---|---|---|---|
| 1 | Top 5 | 花香 | 许绍洋 | 台偶花香 | 00:03:24-00:04:10 |
| 2 | Top 4 | 我难过 | 5566 | 青春台剧 OST | 00:03:32-00:04:13 |
| 3 | Top 3 | 记事本 | 陈慧琳 | KTV 苦情经典 | 00:03:00-00:03:48 |
| 4 | Top 2 | 出卖 | 那英 | 都市情歌利刃 | 00:02:20-00:03:28 |
| 5 | Top 1 | 有没有一首歌会让你想起我 | 周华健 | 集体回忆杀 | 00:03:03-00:04:28 |

## Visual Direction

- 9:16 vertical, 1080x1920.
- Use `DESIGN.md` palette: dark graphite background, warm cream text, red/teal/gold accents.
- Keep source video centered with blurred background fill.
- Text overlay should be compact: rank, song title, performer, word/music credits, one short creation label, source label.
- No TTS for this pass. The source audio is the main listening object.

## Visible Copy Draft

Intro:

```text
周传雄为别人创作的
歌TOP5
KTV 情歌、台偶 OST、都市伤感和集体回忆。
这些副歌，都有小刚写歌的狠准。
```

Closing:

```text
周传雄写给别人的歌
也藏着他的情歌手感
旋律不复杂，但副歌一到就会被记住。
哪一首最能代表你的青春回忆？
```

## Output

```text
sandbox/exports/experiment-023/steve-chou-songs-for-others-top5-preview.mp4
sandbox/exports/experiment-023/steve-chou-songs-for-others-top5-contact-sheet.jpg
```

## QA

- Structure check: completed. Order is `Top5 -> Top4 -> Top3 -> Top2 -> Top1`.
- Text check: completed. Every song has performer, lyricist, composer, and no internal workflow wording.
- Visual check: completed via contact sheet. The frame order and visible copy are correct.
- Export check: completed. MP4 is 1080x1920, H.264/AAC, duration 298.42s.
- Audio check: completed. Mean volume -18.8 dB, max volume -3.6 dB.
