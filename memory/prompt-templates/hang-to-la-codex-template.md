# Codex Prompt Template: 从夯到拉视频

用途：在当前 `wemedia` 项目里，复用已有实验、素材、TTS、HyperFrames/Pillow+ffmpeg 能力，快速制作“从夯到拉”竖屏盘点视频。

## 精简版

```text
/goal
在当前 wemedia 项目基础上，按现有“从夯到拉”视频规范，直接制作一条本地预览短视频。

主题：{主题}
台词/条目：
{把你想说的条目、档位、口播或大概顺序写这里；如果没写全，请你补成可播版本}

要求：
1. 不要搭建新项目结构；复用当前项目约定和已有链路。
2. 先读取 AGENTS.md、memory/video-production-contract.md、memory/project-state.md、memory/learnings.md、DESIGN.md。
3. 新开下一个连续 experiment 编号，写入 experiments/experiment-XXX/。
4. 写剪辑 brief 到 data/briefs/，写来源记录到 data/sources/。
5. 在 hyperframes/projects/<slug>/ 创建或更新视频工程；快速预览可使用当前项目稳定的 Pillow + ffmpeg fallback。
6. 画面沿用“从夯到拉”五档表格：夯、顶级、人上人、NPC、拉完了。
7. 必须逐对象揭晓，一个条目一个条目出现，不要按档位一次性全出现。
8. 字幕用大号黄色底部字幕，不遮挡榜单核心区域。
9. 配音使用当前项目默认本地 TTS 声线和脚本，不要问我要 KEY，不要换旧 TTS 方案。
10. 如果我没有提供图片/音视频素材，你负责处理：优先用项目内已有素材、可追溯素材、程序化图形或生成式占位；需要外部下载时先写候选来源和下载计划，未经确认不做大规模下载。
11. 默认是个人本地测试 demo，输出到 sandbox/exports/experiment-XXX/，并生成 contact sheet。
12. 交付前做结构检查、视觉检查、音视频检查，并更新 run_log、README、demo_output/source_candidates 或等价记录。

完成后直接给我视频预览和 contact sheet 的本地绝对路径。
```

## 完整版

```text
/goal
请在当前 `/Users/yinshawnrao/explorer/wemedia` 项目基础上，制作一条“从夯到拉”中文竖屏盘点视频本地 demo。不要把它当成全新项目，不要新建 `input/ assets/ output/ src/` 这种独立工程；要复用当前项目已经形成的视频生产规范、TTS、渲染、实验记录和 QA 流程。

【我提供的信息】
主题：{主题名称}
目标平台：{抖音/B站/视频号/小红书，默认抖音/B站竖屏}
目标时长：{默认 45-60 秒}
口播风格：{毒舌但不人身攻击 / 搞笑抽象 / 半专业测评 / 轻度吐槽，默认轻度吐槽}
叙事顺序：{默认按条目自然顺序逐个给档}

台词/条目：
{写你的条目、档位、台词、想保留的梗；如果只给主题，请你自动补成一版可播脚本}

素材要求：
- 我只负责提供主题和台词。
- 图片、音频、视频、封面、占位图、配音、字幕、音视频合成，由 Codex 在当前项目能力范围内处理。
- 如果没有必要用外部素材，优先用程序化“分级表 + 条目卡片 + 大字幕 + TTS”完成首版 demo。
- 如果这个主题明显需要真实图片/视频素材，请你负责搜集候选、记录来源和风险，先产出下载计划；未经我确认，不做大规模下载或正式入库。

【启动协议】
开始制作前必须读取并遵守：
- `AGENTS.md`
- `memory/video-production-contract.md`
- `memory/project-state.md`
- `memory/learnings.md`
- `DESIGN.md`

如果延续已有实验，还要读取对应：
- `experiments/<experiment-id>/run_log.md`
- `experiments/<experiment-id>/demo_output.md`
- `experiments/<experiment-id>/source_candidates.md`
- `data/briefs/<slug>.md`

【项目目录约定】
1. 新开实验时使用下一个连续编号：`experiments/experiment-XXX/`。
2. 写剪辑简报：`data/briefs/<slug>.md`。
3. 写素材/来源记录：优先 `data/sources/experiment-XXX_sources.md` 或项目当前约定的同类文件。
4. 视频工程放到：`hyperframes/projects/<slug>/`。
5. 默认本地 demo 输出到：`sandbox/exports/experiment-XXX/`。
6. 默认不要把测试产物写入正式 `downloads/`、`clips/`、`audio/`、`subtitles/`、`assets/exports/`，除非我明确要求正式入库或正式导出。

【内容规则】
1. 固定五档只能是：夯、顶级、人上人、NPC、拉完了。
2. 视频必须逐对象揭晓：一个条目出现、口播一句、入档一次；不要按档位批量出现。
3. 如果我给了台词，优先保留我的表达；只做必要的节奏压缩和字幕化。
4. 如果我只给主题，请你自动生成 8-10 个条目、档位、口播和结尾互动问题。
5. 口播要像中文短视频锐评，不要像论文：
   - “{主题}从夯到拉，主观娱乐版。”
   - “{条目名}，{一句理由/体验}，给到{档位}。”
   - “你不同意很正常，评论区开排。”
6. 不做人身攻击，不攻击私人、未成年人、同学、同事、素人头像。
7. 涉及品牌、商家、产品、医疗、金融、法律等高风险内容时，用“个人体验/仅供娱乐/不构成建议”的口径，并避免绝对化结论。
8. 可见画面不得出现内部词：Codex、提示词、项目约束、sandbox、workflow、实验目录、rights_review、download plan。

【视觉规则】
1. 必须遵守 `DESIGN.md`：深炭黑背景、暖纸色表格、红橙/青绿/暖黄强调，不要默认蓝紫渐变。
2. 主视觉是一张五档排行榜表格，左侧标签为：夯、顶级、人上人、NPC、拉完了。
3. 条目卡片逐个飞入/归位；当前条目需要高亮、描边或轻微动效。
4. 大字幕居中偏下，黄色粗体，不遮挡表格核心内容。
5. 结尾显示完整榜单和互动问题。
6. 若使用真实图片/视频素材，素材不能被重度模糊遮住；要保留来源可追溯性。

【配音与字幕】
1. 使用当前项目默认本地 TTS 配音标准，不要问我要 API KEY。
2. 按 SRT 或等价时间线生成逐句旁白，使口播和条目出现对齐。
3. 若素材含原声且同时需要旁白，按项目约定降低素材原声音量，保证旁白清晰。
4. 字幕文本要短句化；每句尽量能在手机竖屏上读完。

【素材处理】
1. 如果我没有给素材，首版不要卡住：用程序化表格、文字卡片、TTS、必要的生成式/占位视觉完成。
2. 如果要用外部视频/图片，优先官方、创作者授权、Creative Commons、公共领域、用户明确允许使用的素材。
3. 每个候选素材都要记录 URL、标题、来源、用途、授权/风险状态。
4. 下载前先列出下载计划：URL、推荐时间段、用途、预计路径、风险状态。
5. 不规避 DRM、会员墙、地区限制或平台访问控制。

【工程与交付】
请直接制作，不只给建议。完成后至少生成：
- 预览视频：`sandbox/exports/experiment-XXX/<slug>-preview.mp4`
- 视觉检查图：`sandbox/exports/experiment-XXX/<slug>-contact-sheet.jpg`
- 剪辑 brief：`data/briefs/<slug>.md`
- 来源记录：`data/sources/...`
- 实验记录：`experiments/experiment-XXX/README.md`、`run_log.md`，并按项目当前约定补 `demo_output.md` / `source_candidates.md`

【质量检查】
交付前必须检查：
1. 视频是否存在。
2. contact sheet 是否存在且能看出 intro、逐对象揭晓、完整榜单、closing。
3. ffprobe 确认竖屏 1080x1920、H.264、AAC、有音频、时长合理。
4. 字幕无明显溢出、遮挡或内部词。
5. HyperFrames 源文件满足项目约束：timeline 注册、timed clip 属性完整、无 `Math.random()`/`Date.now()`/`setTimeout`/`repeat:-1`。
6. 如果官方 HyperFrames CLI 没法跑，说明原因，并使用项目已验证的本地稳定导出链路。

【最终回复】
完成后用中文简短回复：
- 嵌入视频预览的绝对路径
- 嵌入 contact sheet 的绝对路径
- 一句话 QA 结果
- 说明是否用了外部素材、是否有授权风险
- 给出关键记录文件路径
```

## 最推荐的日常用法

你平时只要发：

```text
/goal
按当前项目“从夯到拉”规范直接做一条本地 demo。

主题：{主题}
台词：
{你的台词；没写全就让 Codex 补齐}
```

如果你希望 Codex 自己写全台词，就发：

```text
/goal
按当前项目“从夯到拉”规范直接做一条本地 demo。

主题：{主题}
台词：你来写，风格轻度吐槽，不人身攻击。
```
