# Experiment 011: 男歌手演唱难度代表作组合盘点

方向：沿用前几条单歌手难度盘点的模式，做一条 4 位男歌手组合盘点。周杰伦、王力宏、陶喆、林俊杰各选一首本地实验版“演唱难度代表作”，每段取高音/高难度段落，并叠加乐理/声乐科普备注。

## Selection Draft

| Singer | Song | Source Type | High-note Remark | Difficulty Focus |
|---|---|---|---|---|
| 周杰伦 | 搁浅 | Official MV | 参考峰值：A4-B4 区间 | 高位副歌、咬字压力、真假声边缘 |
| 王力宏 | 你不在 | Official MV | 参考峰值：B4-C#5 区间 | 强混声、大跳音程、尾段爆发 |
| 陶喆 | 黑色柳丁 | Official MV | 参考峰值：A4-B4 区间 | 摇滚声压、R&B 咬字、律动控制 |
| 林俊杰 | 不为谁而作的歌 | Official HD MV | 参考峰值：C5-D5 区间 | 高位混声、长线支撑、音色稳定 |

## Caution

Pitch labels are local sandbox reference notes, not official score claims. The goal is to compare each singer's different difficulty profile rather than rank them against each other.

## Selection Note

陶喆候选从 `普通朋友` 调整为 `黑色柳丁`。原因是这条视频的主题是“演唱难度代表作”，`普通朋友` 更偏经典度、律动和细腻表达，作为最高难度代表不够有说服力；`黑色柳丁` 更适合展示摇滚声压、R&B 咬字和 groove 控制。

## Output

Generated:

```text
sandbox/exports/experiment-011/male-four-vocal-difficulty-preview.mp4
sandbox/exports/experiment-011/male-four-vocal-difficulty-contact-sheet.jpg
```

## Verification

- Final video: 1080x1920, 30fps, H.264 + AAC stereo 48kHz
- Duration: 170.087667s
- Size: 26,643,531 bytes
- Audio check: mean volume -18.9 dB, max volume -4.9 dB
- Contact sheet reviewed: title cards and four song overlays are readable; no obvious text/subject collision in sampled frames.

## Current Judgment

This is a usable fast local preview. The structure is clearer when the video is framed as “four different hard modes” rather than a strict cross-singer ranking. If this direction is refined, the next pass should verify exact pitch labels with a more formal pitch workflow and tune each clip start point by ear.
