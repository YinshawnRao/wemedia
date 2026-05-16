# Brief: 陶喆为别人创作的歌TOP5

Experiment: `experiment-022`

## Goal

制作一条竖屏音乐盘点 demo，标题为 `陶喆为别人创作的歌TOP5`。用户提供正序排名，成片倒序揭晓，从 Top5 到 Top1。每段取副歌或主 hook 段，保留原曲声音，每首歌标明演唱者、作词、作曲。

## Audience

面向华语流行听众、陶喆歌迷、R&B/制作人作品讨论人群。文字要像观众向音乐盘点，不出现任何项目约束、提示词、素材下载流程或内部目录信息。

## Structure

| Order | Visible Rank | Song | Performer | Visible Label | Clip |
|---|---|---|---|---|---|
| 1 | Top 5 | 我都知道 | 梁静茹 | 轻 R&B 侧面 | 00:03:00-00:03:38 |
| 2 | Top 4 | 好心情 Just Be Yourself | S.H.E | 少女团律动 | 00:01:58-00:02:40 |
| 3 | Top 3 | 手牵手 | 群星 | 时代合唱 | 00:03:42-00:04:52 |
| 4 | Top 2 | 爱什么稀罕 | 张惠妹 | 洒脱快歌 | 00:02:36-00:03:22 |
| 5 | Top 1 | 算你狠 | 陈小春 | 痞气 R&B | 00:00:39-00:01:35 |

## Visual Direction

- 9:16 vertical, 1080x1920.
- Use `DESIGN.md` palette: dark graphite background, warm cream text, red/teal/gold accents.
- Keep source video centered with blurred background fill.
- Text overlay should be compact: rank, song title, performer, word/music credits, one short creation label, source label.
- No TTS for this pass. The source audio is the main listening object.

## Visible Copy Draft

Intro:

```text
陶喆为别人创作的
歌TOP5
R&B、复古律动、群星合唱和温柔侧面。
这些歌，藏着陶喆写给别人的声音。
```

Closing:

```text
陶喆写给别人的歌
也很有他的指纹
律动、和声、复古采样，还有很会抓人的副歌。
哪一首最像被低估的陶喆作品？
```

## Output

```text
sandbox/exports/experiment-022/david-tao-songs-for-others-top5-preview.mp4
sandbox/exports/experiment-022/david-tao-songs-for-others-top5-contact-sheet.jpg
```

## QA

- Structure check: completed. Order is `Top5 -> Top4 -> Top3 -> Top2 -> Top1`.
- Text check: completed. Every song has performer, lyricist, composer, and no internal workflow wording.
- Visual check: completed via contact sheet. The frame order and visible copy are correct.
- Export check: completed. MP4 is 1080x1920, H.264/AAC, duration 262.45s.
- Audio check: completed. Mean volume -18.7 dB, max volume -2.7 dB.
