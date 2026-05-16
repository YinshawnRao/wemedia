# Brief: 张韶涵演唱难度 TOP5

Experiment: `experiment-008`

## Goal

制作一条本地实验版竖屏音乐盘点视频：张韶涵歌曲演唱难度 TOP5。每段使用歌曲中高音或高难度段落，保留原始素材声音，不加旁白。

## Audience

面向短视频平台上的华语音乐听众、KTV/声乐爱好者、张韶涵歌迷。重点不是做严肃声乐论文，而是用“能听懂的音乐科普备注”提升观看和讨论欲。

## Format

- Canvas: 9:16 vertical, 1080x1920
- Duration: about 3:30
- Structure: intro 5s + 5 clips around 40s each + closing 5s
- Voiceover: none
- Audio: source music audio only
- Style source: `DESIGN.md`

## Ranking And Notes

| Rank | Song | Note Text | Difficulty Angle |
|---:|---|---|---|
| 1 | 阿刁 | 参考峰值：C#6-D6 区间 | 高位置强混声 + 长线控制 |
| 2 | 不痛 | 参考峰值：B5-C6 区间 | 副歌连续上行 + 强弱转换 |
| 3 | 呐喊 | 参考峰值：B5 附近 | 高位咬字 + 声压维持 |
| 4 | 寓言 | 参考峰值：A5-Bb5 区间 | 快节奏里保持高位明亮 |
| 5 | 欧若拉 | 参考峰值：A5 附近 | 连续副歌 + 音色稳定 |

## Editorial Caution

The pitch labels are local reference notes, not official score claims. Keep the on-screen language as `参考峰值` unless a later pass verifies the exact notes.

## Current Output

Fast local preview:

```text
sandbox/exports/experiment-008/angela-top5-vocal-difficulty-preview.mp4
```

Contact sheet:

```text
sandbox/exports/experiment-008/angela-top5-vocal-difficulty-contact-sheet.jpg
```

## Next Refinement

If this concept is worth polishing, migrate the approved timing and overlays into a full HyperFrames project, then run HyperFrames lint/inspect/render before treating it as a finished demo.
