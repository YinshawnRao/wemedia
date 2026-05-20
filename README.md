# Wemedia

Wemedia 是一个个人本地短视频制作工作区：围绕一个选题搜集可用视频资源，用 `yt-dlp` 下载或切片 YouTube 素材，再用 HyperFrames 或本地渲染脚本制作短视频预览、contact sheet 和复盘记录。

当前项目重点不是维护一个可商用素材库，而是跑通并沉淀一条可复用的内容实验流程：

```text
选题 -> 素材候选 -> 下载计划 -> 测试切片 -> 剪辑简报 -> 本地 demo -> QA 复盘
```

默认所有音乐盘点和素材实验都按个人本地测试处理；授权不明确的来源会记录为 `rights_review`，但不会被描述为可商用。

## 目录结构

```text
assets/
  raw/                 原始素材，按来源保存
  processed/           切片、转码、抽帧、音频处理等派生素材
  exports/             最终导出视频、封面、字幕
downloads/             yt-dlp 下载的完整原始视频
clips/                 yt-dlp 按时间段下载的视频切片
audio/                 yt-dlp 提取的音频
subtitles/             yt-dlp 下载的字幕
logs/                  下载归档和运行记录
sandbox/               测试流程专用区，临时产物都放这里
memory/                跨对话长期记忆、决策、复盘经验
experiments/           每一轮内容实验的过程档案
data/
  sources/             视频候选、授权、来源清单
  clips/               已选片段、时间码、用途说明
  transcripts/         转写文本、字幕、逐字稿
  briefs/              单条视频的剪辑简报
  notes/               研究笔记和灵感
docs/                  流程、命名、素材政策
prompts/               给 Codex 使用的提示词模板
hyperframes/
  projects/            每条视频一个 HyperFrames 项目
  shared/              可复用视觉、字幕、组件、音效说明
scripts/
  yt-dlp/              下载脚本和命令模板
```

## Git 收纳策略

这个仓库适合提交流程资产和可复盘文本，不适合提交本地媒体资产、模型和运行环境。

建议提交：

- 项目说明、流程文档、提示词模板：`README.md`、`docs/`、`prompts/`、`AGENTS.md`、`DESIGN.md`
- 脚本和轻量配置：`scripts/`、HyperFrames 项目的 `index.html`、`package.json`、`hyperframes.json`、`meta.json`
- 实验档案与来源记录：`experiments/`、`data/sources/`、`data/briefs/`、`memory/`
- 占位文件和 README：各素材目录里的 `.gitkeep` 或说明文件

默认不提交：

- 下载、切片、导出、缓存：`sandbox/`、`downloads/`、`clips/`、`audio/`、`subtitles/`、`assets/exports/`
- 原始或派生媒体：`assets/raw/`、`assets/processed/`、HyperFrames 项目里的 `assets/`
- 本地模型和虚拟环境：`models/`、`.venv-*`、`tts-local-benchmark/vendor/`
- 密钥、cookies、环境变量：`secrets/cookies/`、`.env*`

## 推荐流程

0. 新对话或接手视频任务时，先读 `AGENTS.md` 和 `memory/video-production-contract.md`。当前默认是个人本地测试 demo，临时下载和导出都放在 `sandbox/`。
1. 用 `prompts/01-video-resource-research.md` 让 Codex 搜集候选资源。
2. 把候选结果整理到 `data/sources/`，确认哪些可用、哪些需要授权复核。
3. 用 `prompts/02-yt-dlp-download-plan.md` 生成下载计划。
4. 初期用 `WEMEDIA_OUTPUT_MODE=test` 把下载和切片产物放到 `sandbox/yt-dlp/`。
5. 流程确认后，使用 `scripts/yt-dlp/` 下的脚本下载完整视频、片段、音频或字幕。
6. 用 `prompts/03-editing-brief.md` 生成剪辑简报。
7. 在 `hyperframes/projects/<video-slug>/` 创建 HyperFrames 项目并制作；音乐 TOP 首版 demo 可优先复用 `scripts/video/pillow_top5_renderer.py` 快速出预览。
8. 用 `prompts/05-qa-review.md` 做结构、画面、版权和导出检查；本地 demo 至少保留 MP4 预览和 contact sheet。

## 当前视频实验默认约束

- 默认个人本地测试，不按商业发布包处理。
- 默认输出在 `sandbox/exports/<experiment-id>/`。
- TOP 排名默认倒序揭晓，最后出现 Top1。
- 音乐盘点默认保留素材原声；如果用户要求配音/旁白/解说/口播，自动使用项目默认 Kokoro 声线 `zm_yunxi`，不做付费 TTS，也不再询问声音选择。
- 片头/章节/转场配音最后一个字后，默认留 0.8-1.2 秒听感消化位再切入歌曲或下一段；消化位要有低音量音乐床、素材预入、环境声、转场音或可见运动支撑。含配音/音乐的 demo 不接受超过 1 秒的整片静音，也不接受静态画面无声空等或最后一字硬切。
- 可见视频文案不得出现项目约束、提示词、素材搜集、Codex、sandbox、workflow 等内部词。
- 授权不明确的素材记录为 `rights_review`，但不把它说成可商用。

## 下载示例

```bash
./scripts/yt-dlp/download-clip.sh "https://www.youtube.com/watch?v=VIDEO_ID" "topic_slug" "00:01:10" "00:01:35"
```

下载完整单条视频：

```bash
./scripts/yt-dlp/download-video.sh "https://www.youtube.com/watch?v=VIDEO_ID" "topic_slug"
```

更多命令见 `docs/YT_DLP_USAGE.md`。

## HyperFrames 常用命令

在具体项目目录里执行：

```bash
npx hyperframes lint
npx hyperframes inspect
npx hyperframes preview
npx hyperframes render --quality standard
```

生成正式成片前，先检查 `DESIGN.md` 和对应视频简报是否已经明确风格、节奏、画幅和素材来源。
