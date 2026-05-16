# Brief: 《海阔天空》神级翻唱TOP5

Experiment: `experiment-027`

## Goal

制作一条竖屏音乐盘点 demo，标题为 `《海阔天空》神级翻唱TOP5`。用户提供正序排名，成片按项目 TOP 规则倒序揭晓，从 Top5 到 Top1。每段取副歌高潮或最有辨识度的现场段，保留原声，每个版本标明排名、歌名、演唱者、原唱、作词、作曲。

## Audience

面向华语经典歌听众、港乐记忆受众、喜欢现场翻唱对比的观众。文字要有情绪但不引战，突出“同一首经典，不同歌手唱出不同气质”，不出现任何项目约束、提示词、素材下载流程或内部目录信息。

## Structure

| Order | Visible Rank | Version | Performer | Visible Label | Clip |
|---|---|---|---|---|---|
| 1 | Top 5 | 《声生不息》群星大合唱版 | 群星 | 全场大合唱 | 00:03:35-00:04:07 |
| 2 | Top 4 | 信/苏见信版 | 信/苏见信 | 摇滚高音 | 00:00:42-00:01:14 |
| 3 | Top 3 | 邓紫棋版 | 邓紫棋 | 高爆发现场 | 00:02:55-00:03:27 |
| 4 | Top 2 | 林忆莲版 | 林忆莲 | 温柔倔强 | 00:02:12-00:02:44 |
| 5 | Top 1 | 林子祥版 | 林子祥 | 港乐镇场 | 00:03:32-00:04:04 |

## Visual Direction

- 9:16 vertical, 1080x1920.
- Use `DESIGN.md` palette: dark graphite background, warm cream text, red/teal/gold accents.
- Keep source video centered with blurred background fill.
- Title rule: large title only breaks before `TOP5`; no long stacked title.
- Lower third: rank, song title, performer, original singer, lyricist, composer, one short version note, source label.
- No TTS for this pass. The source audio is the main listening object.

## Visible Copy Draft

Intro:

```text
《海阔天空》神级翻唱
TOP5
同一首经典，谁唱出了你的青春？
同歌不同味道，都是情怀现场。
```

Closing:

```text
哪版最戳你？
同一首歌，听见五种人生气质。
```

## Output

```text
sandbox/exports/experiment-027/haikuotiankong-covers-top5-preview.mp4
sandbox/exports/experiment-027/haikuotiankong-covers-top5-contact-sheet.jpg
```

## QA Result

- Structure check passed: order is `Top5 -> Top4 -> Top3 -> Top2 -> Top1`.
- Text check passed: every version has ranking, song, performer, original singer, lyricist, composer, and visible copy stays audience-facing.
- Visual check passed: contact sheet confirmed live/event visuals for all five sections after replacing the static林忆莲 official audio source with a live upload.
- Export check passed: 1080x1920, 30fps, H.264 + AAC stereo 48 kHz, 170.188s, audio max -1.5 dB.
