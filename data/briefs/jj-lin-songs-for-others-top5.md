# Brief: 林俊杰为别人创作的歌TOP5

Experiment: `experiment-024`

## Goal

制作一条竖屏音乐盘点 demo，标题为 `林俊杰为别人创作的歌TOP5`。用户提供正序排名，成片倒序揭晓，从 Top5 到 Top1。每段取副歌或主 hook 段，保留原曲声音，每首歌标明演唱者、作词、作曲。

## Audience

面向华语流行听众、林俊杰歌迷、青春情歌和 OST 记忆讨论人群。文字要像观众向音乐盘点，不出现任何项目约束、提示词、素材下载流程或内部目录信息。

## Structure

| Order | Visible Rank | Song | Performer | Visible Label | Clip |
|---|---|---|---|---|---|
| 1 | Top 5 | 爱笑的眼睛 | 徐若瑄 | 温柔二次翻红 | 00:03:00-00:03:42 |
| 2 | Top 4 | 一眼万年 | S.H.E | 仙侠 OST 记忆 | 00:02:55-00:04:05 |
| 3 | Top 3 | 心墙 | 郭静 | 青春清亮副歌 | 00:02:40-00:03:36 |
| 4 | Top 2 | 当你 | 王心凌 | 甜心青春开关 | 00:02:46-00:03:30 |
| 5 | Top 1 | 记得 | 张惠妹 | 双版本都能打 | 00:03:05-00:04:25 |

## Visual Direction

- 9:16 vertical, 1080x1920.
- Use `DESIGN.md` palette: dark graphite background, warm cream text, red/teal/gold accents.
- Keep source video centered with blurred background fill.
- Text overlay should be compact: rank, song title, performer, word/music credits, one short creation label, source label.
- No TTS for this pass. The source audio is the main listening object.

## Visible Copy Draft

Intro:

```text
林俊杰为别人创作的
歌TOP5
甜心情歌、青春 OST、仙侠滤镜和经典翻唱记忆。
这些副歌，后来都长成了时代旋律。
```

Closing:

```text
林俊杰写给别人的歌
也很像他的青春底色
旋律简单、情绪直接，副歌一到就会被记住。
哪一首最像你的回忆开关？
```

## Output

```text
sandbox/exports/experiment-024/jj-lin-songs-for-others-top5-preview.mp4
sandbox/exports/experiment-024/jj-lin-songs-for-others-top5-contact-sheet.jpg
```

## QA Result

- Structure check: passed, order is `Top5 -> Top4 -> Top3 -> Top2 -> Top1`.
- Text check: passed, every song has performer, lyricist and composer in the visible lower third.
- Visual check: passed, contact sheet generated and inspected.
- Export check: passed, MP4 is `1080x1920`, H.264, 30 fps, AAC stereo 48 kHz, duration `302.421333s`.
- Audio check: passed, mean volume `-18.9 dB`, max volume `-1.5 dB`.
