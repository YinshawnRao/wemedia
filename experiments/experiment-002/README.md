# Experiment 002

## Direction

华语女歌手音乐盘点短视频。

## Goal

验证“素材自带声音”的音乐盘点流程：

```text
官方 YouTube 音乐素材 -> 极短测试切片 -> 保留原声 -> HyperFrames 盘点包装 -> sandbox demo
```

## Working Concept

不是排名榜单，而是“华语女声 5 种气质”：

1. 邓紫棋：爆发力
2. 蔡依林：舞曲能量
3. 孙燕姿：叙事感
4. 张惠妹：现场感和力量
5. 王菲：空灵感

## Copyright Note

本实验使用官方 YouTube 音乐视频的极短测试片段，全部标记为 `rights_review`。这只用于 sandbox 流程验证，不是可直接发布的最终成片。正式发布需要授权素材、平台可用曲库，或更强的评论/解说结构与更短引用。

## Status

- 已搜索候选来源。
- 已下载 5 段极短测试切片，并保留原始音乐音频。
- 已完成 HyperFrames sandbox demo。
- 已通过视频音轨检查、HyperFrames lint 和布局抽样检查。

## Output

- Demo: `sandbox/exports/experiment-002/chinese-female-singers-demo.mp4`
- Contact sheet: `sandbox/exports/experiment-002/chinese-female-singers-contact-sheet.jpg`
- HyperFrames source: `sandbox/hyperframes/experiment-002/index.html`

## Verification

- Video: 1080x1920, 30fps, 38.021s
- Audio: AAC stereo, 48000 Hz
- Volume check: mean `-18.7 dB`, max `-1.4 dB`
- HyperFrames lint: `0 errors, 0 warnings`
- HyperFrames inspect: `0 layout issues across 12 samples`
