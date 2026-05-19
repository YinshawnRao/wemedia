# Wemedia Agent Contract

默认用中文协作，代码和命令说明尽量简洁。这个项目的目标是：围绕一个选题搜集可用视频资源，用 `yt-dlp` 入库 YouTube 素材，再用 HyperFrames 制作短视频或切片视频。

## 新会话启动协议

任何新对话、上下文压缩后恢复、或接手已有视频制作任务时，先执行这一组读取和对齐动作。除非用户明确说“只回答问题，不读项目文件”，否则这是硬性要求：

1. 先确认当前目录是 `/Users/yinshawnrao/explorer/wemedia`。
2. 先读本文件 `AGENTS.md`、`memory/video-production-contract.md`、`memory/project-state.md`、`memory/learnings.md` 和 `DESIGN.md`，再开始搜素材、下载或剪辑。
3. 如果用户是在延续某个实验，继续读对应 `experiments/<experiment-id>/run_log.md`、`demo_output.md`、`source_candidates.md` 和 `data/briefs/<slug>.md`。
4. 新开实验时用下一个连续编号 `experiments/experiment-XXX/`，不得另起随意目录名。
5. 如果本文件和历史对话印象冲突，以本文件和 `memory/video-production-contract.md` 为准。

## 当前默认模式

- 默认协作模式是“个人本地测试 / 实验预览”，不是商业发布包、不是正式素材库入库。
- 用户没有明确说“正式入库”“正式发布”“生成可商用交付包”时，一律使用 `WEMEDIA_OUTPUT_MODE=test` 的思路。
- 默认所有下载、切片、渲染、接触表、试剪视频都写入 `sandbox/`；不得把测试产物写进 `downloads/`、`clips/`、`audio/`、`subtitles/`、`assets/exports/` 等正式目录。
- 音乐盘点类 demo 默认优先保留素材原声；只要用户明确要求配音、旁白、解说或口播，自动使用当前项目默认配音声线，不再询问 TTS 方案或声音选择。
- 默认交付的是本地 demo：`sandbox/exports/<experiment-id>/<slug>-preview.mp4` 和 `<slug>-contact-sheet.jpg`。
- 所有未明确授权的音乐/视频素材仍标记 `rights_review`；这表示“本地测试仍需留痕”，不是“阻止制作”。不能声称可商用。

## 工作顺序

1. 先确认视频目标：主题、受众、平台、时长、画幅、语气、是否需要旁白/字幕、素材授权边界。
2. 搜集资源时，优先官方频道、创作者授权、Creative Commons、公共领域、用户明确提供且允许使用的素材。每个候选视频必须记录到 `data/sources/`。
3. 下载前先产出下载计划，说明 URL、推荐时间段、用途、预计保存路径、授权/风险状态。未经用户确认，不做大规模下载。
4. 项目初期或试跑流程时，默认使用 `WEMEDIA_OUTPUT_MODE=test`，把临时下载和日志写入 `sandbox/yt-dlp/`。
5. 正式 `yt-dlp` 下载的完整原始视频放到 `downloads/<slug>/`，并保留 info json、字幕、缩略图等元数据。
6. 正式 `yt-dlp` 直接下载的时间片段放到 `clips/<slug>/`；音频放到 `audio/<slug>/`；字幕放到 `subtitles/<slug>/`。
7. 切片、转码、抽帧、降噪等进一步派生素材可以放到 `assets/processed/`，不要覆盖原始素材。
8. 进入 HyperFrames 前，先写剪辑简报到 `data/briefs/`，再创建或更新 `hyperframes/projects/<video-slug>/`。
9. 制作 HyperFrames 时必须读取 `DESIGN.md`，按其中的色彩、字体、动效气质执行。
10. 交付前至少做一次结构检查、视觉检查和导出检查；如果没法运行检查，要明确说明原因。

## 默认本地配音标准

- 当前唯一默认配音标准是 `tts-local-benchmark` 中用户认可的 Kokoro 声线：`zm_yunxi`。
- 配置文件：`config/tts/default-voiceover.json`。
- 生成入口：`scripts/tts/render-default-voiceover.sh`。
- 混音入口：`scripts/tts/add-voiceover.sh`。
- 一步式视频配音入口：`scripts/tts/voiceover-video.sh`。
- 触发规则：用户说“配音”“旁白”“解说”“口播”“读稿”“有声音”“voiceover”“narration”，或要求“做一个有配音的视频”时，默认自动使用 `zm_yunxi` 生成旁白并接入视频流程。
- 输出位置：默认写入 `sandbox/voiceover/<experiment-id>/` 或当前任务的 sandbox 目录，不写入正式 `audio/`，除非用户明确要求正式入库。
- 不再使用已废弃的旧 Kokoro ONNX runtime、`.venv-kokoro-runtime`、`models/kokoro/`、`am_michael`、`zf_xiaobei` 或旧 voice-map 文件。
- 如果视频原本有素材原声且用户要求配音，默认降低素材原声音量并让旁白保持清晰；音乐盘点是否保留完整副歌优先级高于旁白密度。
- 配音与音乐/画面衔接是硬约束：旁白结束后不能产生死静或静止空等；全片不得出现超过 1 秒的可感知整片静音空档。
- 片头标题、章节/转场介绍文字的配音结束后，必须保留约 1 秒（0.8-1.2 秒）的听感消化位，再切入歌曲或下一段盘点；不得在最后一个字刚落下的瞬间硬切。这个停顿应保留当前画面或轻微运动，并用低音量音乐床、素材预入、环境声或转场音支撑，避免变成死静。
- 不允许“静止画面 + 无声等待”作为转场。片头、章节卡、结尾卡如果超过 1.5 秒，必须有旁白、素材原声、背景音乐或明确的视觉运动；否则缩短、叠到 MV/现场画面上，或改成有声过渡。
- 使用 Pillow/ffmpeg 快速预览时，禁止生成长时间 `anullsrc` 静态段后再依赖后期配音覆盖；每个 still/slate 段的时长必须跟配音或背景声实际长度对齐。片头/转场卡按“裁尾后的可听旁白时长 + 默认约 1 秒消化位”计算，其它旁白边界可贴边或轻微交叠到下一段素材声。
- 未来如需换声音，必须由用户明确提出“更换默认配音声线”后再重新调整；在此之前，所有配音需求都使用 `zm_yunxi`。

## 音乐盘点视频硬规则

- 明确 `TOP5`、`TOP10`、`最难`、`最甜`、`盘点排名` 时，默认按倒序揭晓：`Top N -> Top 1`。
- 用户给出 1-5 正序排名时，成片仍要倒过来剪；这是剪辑悬念逻辑，不得写进标题。
- 标题要短。片头大标题只放核心题目；如果要换行，通常只有 `TOP5` / `TOP10` 可以单独换行。
- 每段默认取副歌、最高音、最甜、最难、最有记忆点或用户指定的关键段落；不要截前奏过长的段落。
- 音乐难度类默认每首约 30-34 秒，整体约 3 分钟；如果用户要求“更长”“完整副歌”，再延长。
- 可见文案只面向观众：歌名、歌手、排名、词曲、唱法/听感/情绪点评。绝不出现项目约束、提示词、素材搜集、Codex、sandbox、workflow、实验目录、任务说明等内部词。
- 难度视频不要只看最高音。根据歌手类型写不同“难法”：强混、换声区、咬字、气息、真假声、律动、轻控制、持续声压、情绪推进、现场稳定度等。
- 创作者/代写作品盘点优先写歌名、原唱、作词、作曲、创作辨识度；不要套演唱难度语言。
- 甜歌/情绪类盘点用听感标签和情绪标签，不要误写成音高科普。
- 轻吐槽或翻车盘点必须克制，不攻击歌手；使用“意外、乌龙、互动、救场、考古、争议点”等温和框架。

## 素材选择与下载约束

- 音乐盘点的来源优先级：官方 MV > 官方 live > 官方 audio / artist Topic > 可信授权源 > `rights_review` 备选源。
- 官方 audio / artist Topic 可以作为首版本地预览的声音优先方案；如果画面太静，后续再替换为 MV 或现场源，并在 `source_candidates.md` 说明。
- 不用非官方源替换官方源，除非官方源没有画面、没有目标片段、质量太差或下载失败；替换原因必须记录。
- YouTube 搜索和下载默认顺序执行，不并行跑多个 `yt-dlp`，避免本机/沙盒 semaphore 问题。
- `yt-dlp` 默认参数包含 `--cookies-from-browser chrome --js-runtimes node --merge-output-format mp4`。
- 测试切片默认限制最高 1080p：`YTDLP_FORMAT='bv*[height<=1080]+ba/b[height<=1080]/b'`。
- 音乐盘点首版通常不需要下载字幕；可用 `--no-write-subs --no-write-auto-subs` 减少字幕 HTTP 429 风险。
- 如果 YouTube 返回 bot/cookie 问题，先确认 Chrome 登录和 cookies 权限；不要重新安装 `yt-dlp`。
- 如果下载单段出现 DNS、EOF、字幕 429 等问题，先保留同一 URL 和切点重试或换更保守格式；连续失败再换源。

## 项目记忆

- 跨对话需要继承的状态写入 `memory/`。
- 每轮实验的计划、选题、素材候选、brief、复盘写入 `experiments/<experiment-id>/`。
- 临时下载、测试导出、试剪产物写入 `sandbox/`，这些内容可以删除和重跑。
- 每次完成有价值的流程调整、失败原因或选题判断后，更新 `memory/learnings.md` 或当前实验的 `run_log.md`。
- 每次完成视频 demo 后必须更新：当前实验 `README.md`、`source_candidates.md`、`run_log.md`、`demo_output.md`，对应 `data/sources/`、`data/briefs/`，以及 `memory/project-state.md` 和必要的 `memory/learnings.md`。
- 如果发生可复用错误或修复方式，也要更新 `.learnings/ERRORS.md`。

## 剪辑叙事约束

- `TOP5`、`TOP10` 等明确排名类视频，默认按倒序揭晓：先从 Top N / 第 5 名开始，最后揭晓 Top 1，保留悬念。
- 除非用户明确要求正序、时间线或主题章节，剪辑 brief、片头文案、字幕编号和导出顺序都必须遵守倒序排名。
- 如果视频不是排名而是“代表作”“主题切面”“一人一首”，不要硬写 Top 编号，可改用章节名或能力标签。

## 素材与版权约束

- 不帮助规避 DRM、会员墙、地区限制或平台访问控制。
- 不能把“能下载”当成“能商用”。授权不明确时标记为 `rights_review`。
- 当前音乐盘点默认是个人本地测试用途，不按商业发布包处理；但仍需记录来源、时间段和风险状态。
- 所有成片都要能追溯来源：URL、标题、频道、发布日期、下载日期、使用片段、用途。
- 对新闻、评论、教育类二创，优先保留引用上下文，避免误导性剪辑。

## 默认交付和 QA

- 每个本地 demo 至少导出一个预览 MP4 和一张 contact sheet。
- 默认规格：竖屏 `1080x1920`、H.264、AAC stereo、30fps 左右。
- 交付前必须检查：倒序/章节结构、可见文案黑名单、接触表视觉可读性、音频存在、导出尺寸和时长。
- 含配音或音乐盘点的 demo 必须额外检查音频连续性、死画面和旁白后停顿：`silencedetect` 不得出现超过 1 秒的整片静音；片头/章节/转场旁白最后一个可听字后，应有 0.8-1.2 秒消化位再进入歌曲或下一段；章节交界处不得出现“配音已停、音乐未起、画面静止”的空等，也不得出现最后一个字刚结束就瞬间硬切；如果发现必须返工后再交付。
- 如果使用 `scripts/video/pillow_top5_renderer.py` 快速预览，要先做 Python 语法检查；`PYTHONPYCACHEPREFIX` 指向 `sandbox/pycache`。
- 最终回复用户时要给出本地视频和 contact sheet 的绝对路径图片/视频链接，并简要说明 QA 结果和记录文件位置。

## HyperFrames 约束

- 视频画面和音频分轨：`<video>` 必须 `muted playsinline`，音频单独用 `<audio>`。
- 所有 timed clip 都要有 `id`、`data-start`、`data-track-index`；非媒体元素还要有 `data-duration`。
- 组合必须注册 `window.__timelines["<composition-id>"]`，timeline 使用 `{ paused: true }`。
- 不用 `repeat: -1`、`Math.random()`、`Date.now()`、`setTimeout` 或异步方式构建 timeline。
- 先做静态 hero frame 布局，再加 `gsap.from()` / `gsap.to()` 动画。
- 不用默认泛蓝/泛紫/灰卡片风格；视觉必须来自 `DESIGN.md` 或用户明确指定。
