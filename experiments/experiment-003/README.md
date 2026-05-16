# Experiment 003

## Direction

华语女歌手音乐盘点长版测试。

## Goal

修正 `experiment-002` 的核心问题：每段切片太短，观众还没听到完整副歌或记忆点就切走。

本实验验证：

```text
10 位女歌手 -> 每段约 27 秒副歌/Hook -> 保留原始音频 -> 竖屏盘点包装 -> sandbox demo
```

## Working Concept

标题：华语女声 10 个副歌瞬间

不是排名榜单，而是声音气质和副歌记忆点盘点：

1. G.E.M. 邓紫棋：爆发力
2. 蔡依林 Jolin：舞曲能量
3. 孙燕姿：叙事感
4. 张惠妹 A-Mei：现场感和力量
5. 王菲 Faye Wong：空灵氛围
6. 梁静茹 Fish Leong：温柔坚定
7. 田馥甄 Hebe：青春电影感
8. 张韶涵 Angela Zhang：清亮穿透
9. 林忆莲 Sandy Lam：都市情绪
10. 王心凌 Cyndi Wang：甜酷动感

## Copyright Note

本实验仍属于本地 sandbox 测试。素材来自 YouTube 音乐视频的短片段，全部标记为 `rights_review`。用户已明确本轮只做本地实验，但正式发布前仍需要重新确认授权、平台曲库或评论/赏析结构。

## Status

- 已确定 10 位歌手和候选来源。
- 已下载 10 段较长副歌/Hook 测试片段。
- 已统一重编码为 1080x1920、30fps、AAC 双声道素材。
- 已完成 HyperFrames 长版工程，并通过 lint/inspect。
- HyperFrames 全量渲染对 4 分 40 秒长视频过慢，本轮改用 ffmpeg 快速预览导出。
- 已完成长版本地预览 demo。

## Output

- Preview demo: `sandbox/exports/experiment-003/chinese-female-singers-long-chorus-preview.mp4`
- Contact sheet: `sandbox/exports/experiment-003/chinese-female-singers-long-chorus-contact-sheet.jpg`
- HyperFrames source: `sandbox/hyperframes/experiment-003/index.html`
- Fast preview script: `experiments/experiment-003/render_ffmpeg_preview.sh`

## Verification

- Video: 1080x1920, 30fps, 280.021s
- Audio: AAC stereo, 48000 Hz
- Volume check: mean `-18.4 dB`, max `-1.1 dB`
- HyperFrames lint: `0 errors, 0 warnings`
- HyperFrames inspect: `0 layout issues across 16 samples`
