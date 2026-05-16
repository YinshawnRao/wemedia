# Decisions

## 2026-05-10: Use Sandbox for Early Workflow Tests

早期试跑流程时，所有临时下载、切片、字幕、音频和测试日志写入：

```text
sandbox/yt-dlp/
```

正式目录等流程稳定后再使用：

```text
downloads/
clips/
audio/
subtitles/
logs/
```

Reason: 避免测试产物污染正式素材库，也方便反复重跑和清理。

## 2026-05-10: Keep Persistent Knowledge in `memory/`

跨对话需要继承的项目状态、流程决策、复盘经验放入 `memory/`。

Reason: 新开对话后可以快速恢复上下文，不依赖聊天记录完整存在。

## 2026-05-10: Track Experiments Separately from Temporary Outputs

每轮实验的计划、选题池、素材候选、brief、复盘放入：

```text
experiments/<experiment-id>/
```

临时下载和导出放入：

```text
sandbox/
```

Reason: 实验过程和结论有复用价值，临时媒体产物通常没有长期保存价值。

## 2026-05-10: First Test Uses Fun Science, Not a Fixed Niche

第一轮测试方向是趣味科普，但不把账号长期固化到单一主题。

Reason: 用户还在探索阶段，目标是验证短视频流程和内容模板，而不是提前锁死赛道。

## 2026-05-16: Treat Music Videos As Personal Local Experiments By Default

没有明确要求正式入库、正式发布或商业交付时，音乐盘点视频默认是个人本地测试 demo。

默认输出位置：

```text
sandbox/yt-dlp/clips/<experiment-id>/
sandbox/hyperframes/<experiment-id>/
sandbox/exports/<experiment-id>/
```

Reason: 用户连续多轮音乐盘点都在验证选题、切点、节奏和包装，不希望测试产物污染正式素材库。

## 2026-05-16: Preserve Cross-Conversation Behavior In Project Files

新对话处理视频前必须读取：

```text
AGENTS.md
memory/video-production-contract.md
memory/project-state.md
memory/learnings.md
DESIGN.md
```

Reason: 用户担心新开对话丢失目录边界、个人测试版权口径、TOP 倒序、无配音、原声优先、sandbox 输出等上下文；这些规则必须由项目文件承载，而不是依赖聊天历史。

## 2026-05-16: First Demo Uses Stable Preview Renderer Unless Polish Is Requested

音乐 TOP 视频首版 demo 默认优先使用：

```text
scripts/video/pillow_top5_renderer.py
experiments/<experiment-id>/render_top5_preview_pillow.py
```

Reason: 该路径已经在多轮实验里稳定产出竖屏预览和接触表。HyperFrames 仍用于精修、复杂动效或用户明确要求的成片制作。
