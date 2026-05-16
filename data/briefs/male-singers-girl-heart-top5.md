# Brief: 男歌手写少女心女声歌TOP5

Experiment: `experiment-026`

## Goal

制作一条竖屏音乐盘点 demo，标题为 `男歌手写少女心神曲TOP5`。用户提供正序排名，成片倒序揭晓，从 Top5 到 Top1。每段取副歌或主 hook 段，保留原曲声音，每首歌标明原唱、作词、作曲。

## Audience

面向华语流行听众、甜歌记忆杀受众、对幕后创作有兴趣的观众。文字要轻松但克制，突出“原来这么甜是男歌手写的”这层反差，不出现任何项目约束、提示词、素材下载流程或内部目录信息。

## Structure

| Order | Visible Rank | Song | Original Singer | Visible Label | Clip |
|---|---|---|---|---|---|
| 1 | Top 5 | Honey Honey Honey | 萧亚轩 | 才子恋爱泡泡 | 00:01:10-00:01:42 |
| 2 | Top 4 | 说爱你 | 蔡依林 | 周董甜到冒泡 | 00:00:44-00:01:16 |
| 3 | Top 3 | 当你 | 王心凌 | JJ校园少女心 | 00:00:48-00:01:20 |
| 4 | Top 2 | 我会好好的 | 王心凌 | 伍佰写温柔失恋 | 00:01:25-00:01:57 |
| 5 | Top 1 | 睫毛弯弯 | 王心凌 | 曹格写甜心教主 | 00:00:49-00:01:21 |

## Visual Direction

- 9:16 vertical, 1080x1920.
- Use `DESIGN.md` palette: dark graphite background, warm cream text, red/teal/gold accents.
- Keep source video centered with blurred background fill.
- Title rule: large title only breaks before `TOP5`; no long stacked title.
- Lower third: rank, song title, original singer, lyricist, composer, one short反差萌 note, source label.
- No TTS for this pass. The source audio is the main listening object.

## Visible Copy Draft

Intro:

```text
男歌手写少女心神曲
TOP5
原来这些甜歌，背后都是男歌手写的？
反差萌一开口，回忆滤镜就亮了。
```

Closing:

```text
哪首最意外？
下一期想看硬汉男歌手写苦情女歌，还是摇滚歌手写甜歌？
```

## Output

```text
sandbox/exports/experiment-026/male-singers-girl-heart-top5-preview.mp4
sandbox/exports/experiment-026/male-singers-girl-heart-top5-contact-sheet.jpg
```

## QA Result

- Structure check passed: order is `Top5 -> Top4 -> Top3 -> Top2 -> Top1`.
- Text check passed: every song has original singer, lyricist, composer, and visible copy stays audience-facing.
- Visual check passed after shortening the closing title to `哪首最意外？`; only `TOP5` is separated as a large title line break.
- Export check passed: 1080x1920, 30fps, H.264 + AAC stereo 48 kHz, 170.221s, audio max -1.8 dB.
