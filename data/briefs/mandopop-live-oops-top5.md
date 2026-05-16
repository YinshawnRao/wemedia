# Brief: 华语live翻车名场面TOP5

Experiment: `experiment-028`

## Goal

制作一条竖屏音乐盘点 demo，标题为 `华语live翻车名场面TOP5`。用户提供正序排名，成片按项目 TOP 规则倒序揭晓，从 Top5 到 Top1。每段取最有代表性的现场片段，保留原声，每个片段标明排名、歌手/组合、歌曲名、现场/节目名称或年份信息。

## Audience

面向华语流行听众、考古名场面受众、喜欢轻松复盘 live 现场的人。文字要轻松、有梗但不恶意，不出现任何项目约束、提示词、素材下载流程或内部目录信息。

## Structure

| Order | Visible Rank | Singer / Group | Song | Scene Info | Visible Label | Clip |
|---|---|---|---|---|---|---|
| 1 | Top 5 | 李玟 | Di Da Di | 《声生不息》相关片段 | 救场变互动梗 | 00:00:03-00:00:35 |
| 2 | Top 4 | 戴佩妮 | 怎样 | 演唱会递麦男粉 | 互动翻车 | 00:00:04-00:00:36 |
| 3 | Top 3 | 王菲、陈奕迅 | 因为爱情 | 2012央视春晚 | 梦幻同台争议点 | 00:01:02-00:01:34 |
| 4 | Top 2 | 萨顶顶 | 大名顶顶 | 2016央视元宵晚会 | 话筒乌龙 | 00:00:08-00:00:40 |
| 5 | Top 1 | 飞轮海 | 我有我的YOUNG | 2006 HitFM现场片段 | 真唱考古 | 00:00:14-00:00:46 |

## Visual Direction

- 9:16 vertical, 1080x1920.
- Use `DESIGN.md` palette: dark graphite background, warm cream text, red/teal/gold accents.
- Keep source video centered with blurred background fill.
- Title rule: large title only breaks before `TOP5`; no long stacked title.
- Lower third: rank, singer/group, song, scene/year info, one short light comment, source label.
- No TTS for this pass. The source audio is the main listening object.

## Visible Copy Draft

Intro:

```text
华语live翻车名场面
TOP5
有些现场，歌手本人可能也想重来一次
轻松复盘，不开恶意。
```

Closing:

```text
哪段最有记忆点？
真实 Live 的魅力，就是永远无法重录。
```

## Output

```text
sandbox/exports/experiment-028/mandopop-live-oops-top5-preview.mp4
sandbox/exports/experiment-028/mandopop-live-oops-top5-contact-sheet.jpg
```

## QA Result

- Structure check passed: order is `Top5 -> Top4 -> Top3 -> Top2 -> Top1`.
- Text check passed: every section has ranking, singer/group, song, scene/year info, and visible copy stays audience-facing.
- Tone check passed: copy avoids insulting or malicious wording.
- Visual check passed: contact sheet confirms all five sections are recognizable enough for local preview.
- Export check passed: 1080x1920, 30fps, H.264 + AAC stereo 48 kHz, 170.087667s, audio max -1.4 dB.
