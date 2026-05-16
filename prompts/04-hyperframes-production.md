# Prompt: HyperFrames Production

请根据剪辑简报制作或修改 HyperFrames 项目。

输入：

```text
<粘贴 data/briefs/<slug>.md 内容和素材路径>
```

必须执行：

1. 读取根目录 `DESIGN.md`，除非用户另给视觉方向。
2. 在 `hyperframes/projects/<slug>/` 下工作。
3. 先搭静态 hero frame 布局，再加动画。
4. 视频和音频分轨：video muted playsinline，audio 单独存在。
5. 每个 timed clip 都有 `id`、`data-start`、`data-track-index`。
6. 注册 `window.__timelines["<composition-id>"]`，timeline paused。
7. 不用 `repeat: -1`、随机数、真实时间、异步 timeline 构建。
8. 完成后运行 lint 和 inspect；如果不能运行，说明原因。

输出：

- 修改了哪些文件
- 预览方式
- 检查结果
- 导出文件路径，如已渲染

