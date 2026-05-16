# Brief: 男歌手演唱难度代表作组合盘点

Experiment: `experiment-011`

## Goal

制作一条本地实验版竖屏音乐盘点视频：周杰伦、王力宏、陶喆、林俊杰各选一首演唱难度代表作。每段使用高音或高难度段落，保留原始素材声音，不加旁白。

## Audience

面向短视频平台上的华语音乐听众、KTV/声乐爱好者和四位歌手的粉丝。重点是讲清楚“难法不同”：周杰伦难在高位咬字和情绪压迫，王力宏难在混声和音程，陶喆难在律动/R&B 咬字和摇滚声压，林俊杰难在高位混声长线稳定。

## Format

- Canvas: 9:16 vertical, 1080x1920
- Duration: about 2:50
- Structure: intro 5s + 4 clips around 40s each + closing 5s
- Voiceover: none
- Audio: source music audio only
- Style source: `DESIGN.md`

## Selection And Notes

| Singer | Song | Note Text | Difficulty Angle |
|---|---|---|---|
| 周杰伦 | 搁浅 | 参考峰值：A4-B4 区间 | 高位副歌 + 咬字压力 |
| 王力宏 | 你不在 | 参考峰值：B4-C#5 区间 | 强混声 + 大跳音程 |
| 陶喆 | 黑色柳丁 | 参考峰值：A4-B4 区间 | 摇滚声压 + R&B 律动 |
| 林俊杰 | 不为谁而作的歌 | 参考峰值：C5-D5 区间 | 高位混声 + 长线支撑 |

## Editorial Caution

The pitch labels are local reference notes, not official score claims. Keep the on-screen language as `参考峰值` unless a later pass verifies exact notes.

## Current Output

Generated fast local preview:

```text
sandbox/exports/experiment-011/male-four-vocal-difficulty-preview.mp4
```

Generated contact sheet:

```text
sandbox/exports/experiment-011/male-four-vocal-difficulty-contact-sheet.jpg
```

## QA Notes

- Duration: about 2:50
- Output: 1080x1920, 30fps, H.264 + AAC stereo
- Audio: source music retained and normalized; no voiceover
- Editorial note: 陶喆选曲已从 `普通朋友` 换成 `黑色柳丁`，更符合“演唱难度代表作”的主题。
