# Prompt: QA Review

请审查当前视频项目是否可以交付。

输入：

```text
<粘贴 HyperFrames 项目路径、brief、source manifest、clip manifest>
```

检查维度：

- 叙事是否清楚，有没有跑题
- hook 是否足够快
- 字幕是否挡住关键画面
- source label 和 attribution 是否充分
- 是否存在授权不明素材进入成片
- HyperFrames data attributes 是否完整
- video/audio 是否分轨
- timeline 是否同步且无无限循环
- 是否通过 lint、inspect、preview、render
- 导出文件是否在 `assets/exports/<slug>/`

输出：

1. 是否可交付
2. 必修问题，按严重程度排序
3. 可选改进
4. 需要用户确认的问题

