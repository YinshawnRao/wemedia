# Learnings

## Template

```text
Date:
Experiment:
Learning:
Evidence:
Action:
```

## 2026-05-10: First Workflow Should Optimize for Feasibility, Not Virality

Experiment: `experiment-001`

Learning: 第一轮只验证链路能不能跑通，不要求做出爆款。选题应优先满足：视觉反直觉、素材安全、30-45 秒能讲完、下载/剪辑难度低。

Action: 趣味科普第一轮优先选择 NASA 等官方公开素材，降低版权和素材可得性风险。

## 2026-05-10: Browser Cookies Require Chrome Permission

Experiment: `experiment-001`

Learning: `--cookies-from-browser chrome` 第一次失败是因为 Chrome/钥匙串权限被拒绝；重新允许权限后，yt-dlp 成功读取 1728 cookies，并通过 YouTube 格式检查。

Evidence: 第二次运行 `WEMEDIA_OUTPUT_MODE=test ./scripts/yt-dlp/list-formats.sh "https://www.youtube.com/watch?v=d0FAgKZU880"` 成功列出格式，并使用 Node 解决 YouTube JS challenge。

Action: 默认继续使用 Chrome cookies；手动 cookies 文件不进入当前主流程。

## 2026-05-10: First yt-dlp Test Clip Succeeded

Experiment: `experiment-001`

Learning: 测试模式可以正常把 YouTube 切片写入 `sandbox/yt-dlp/clips/<slug>/`，并生成 MP4、缩略图、info json 和 description。

Evidence: `clip-001` 已保存，ffprobe 显示 H.264 + AAC，640x360，约 8.008 秒。

Action: 下一步进入 HyperFrames demo，先验证素材引用、字幕、source label 和简单转场。

## 2026-05-10: Re-encode YouTube Clips Before HyperFrames Render

Experiment: `experiment-001`

Learning: yt-dlp 切出的测试片段可以直接渲染，但 HyperFrames 对稀疏关键帧会提示 seek/frame freeze 风险。进入剪辑前最好先重编码成稳定 30fps、短 GOP 的 H.264 MP4。

Evidence: 首次 render 时 HyperFrames 提示 source video has sparse keyframes；使用 ffmpeg 重编码后警告消失。

Action: 后续下载切片后增加一个 processing step，把待剪素材重编码为 HyperFrames-friendly 版本。

## 2026-05-10: First HyperFrames Demo Rendered Successfully

Experiment: `experiment-001`

Learning: `yt-dlp -> sandbox clip -> HyperFrames project -> lint -> inspect -> render -> ffprobe` 的最小链路已跑通。

Evidence: `sandbox/exports/experiment-001/space-flame-demo.mp4` 已导出，1080x1920，30fps，约 40.02 秒；lint 0/0；inspect 0 layout issues。

Action: 下一步由用户看片后决定是否调整节奏、字幕密度、视觉风格，或进入第二条选题测试。

## 2026-05-10: Local macOS `say` Is a Useful TTS Fallback

Experiment: `experiment-001`

Learning: Noiz timeline TTS may fail due to service-side errors. On this Mac, local `say -v Tingting` can generate usable Chinese narration when run with normal local permissions.

Evidence: Noiz returned JSON `500 Server Error` for segment 1; macOS `say` generated five AIFF segments, which were mixed into `assets/narration.wav` and rendered into `space-flame-demo-voiceover.mp4`.

Action: For sandbox demos, use macOS `say` as a fast fallback. For publish-quality videos, later evaluate a better Mandarin TTS voice or voice-clone workflow.

## 2026-05-10: Music Roundups Need Source Audio First

Experiment: `experiment-002`

Learning: 音乐盘点视频的主要体验来自原始歌曲/现场片段的声音；如果素材切片本身没有可用音频，再补旁白也会显得生硬。当前阶段先跳过付费 TTS，优先验证“短切片原声 + 文字包装 + 节奏转场”。

Evidence: `chinese-female-singers-demo.mp4` 使用 5 段带 AAC 音频的官方 YouTube 测试切片，导出后 ffprobe 显示 AAC stereo 48000 Hz，volumedetect 显示 mean `-18.7 dB`、max `-1.4 dB`。

Action: 后续音乐类实验必须先确认切片内有音轨，并在 HyperFrames 中采用“muted video + separate audio”的结构。

## 2026-05-10: Music Clip Publishing Risk Is Higher Than Science Footage

Experiment: `experiment-002`

Learning: 华语音乐 MV/官方频道素材适合验证流程和节奏，但版权风险明显高于 NASA 科普素材。即使使用很短片段，也不能默认可发布。

Evidence: Experiment 002 全部候选都标记为 `rights_review`，demo 也在画面上标注 `SANDBOX / RIGHTS REVIEW`。

Action: 正式发布音乐盘点前，需要改用已授权素材、平台曲库，或设计成更明确的评论/赏析结构，并控制引用时长。

## 2026-05-10: Public Direct Media Is Safer Than Cookie-Based YouTube for Batch Tests

Experiment: `experiment-003`

Learning: 大批量沙盒短片更适合优先使用 FedFlix、CDC Stacks、NOAA 等公共直链素材；YouTube 未登录下载容易触发 bot verification，浏览器 cookie 路线不适合作为默认批量流程。

Evidence: YouTube 直下失败后，10 条公共直链素材全部成功切片、保留原声、通过 HyperFrames lint/inspect/render；其中一次无声素材候选被替换为有旁白的 CDC 飞沫视频。

Action: 后续批量测试先确认素材有音轨，再下载/切片；进入 HyperFrames 前统一重编码为 30fps、短 GOP 的 H.264/AAC。

## 2026-05-10: Music Roundup Segments Need 25-30 Seconds

Experiment: `experiment-003`

Learning: 对音乐盘点来说，6 秒只能展示“名字和画面”，很难让副歌或 hook 真正落地。10 人盘点的本地实验里，每段约 27 秒的节奏明显更适合听到完整记忆点。

Evidence: 用户反馈 `experiment-002` 效果不错但切片太短，“有的副歌部分都还没听到就切走了”。`experiment-003` 改为 10 位女歌手、每段 27.1 秒，最终预览时长 280.021 秒。

Action: 后续音乐类盘点默认把单人片段预算设为 25-30 秒；如果要做 60-90 秒短视频，则只选 3-4 位歌手，而不是硬塞 10 位。

## 2026-05-10: Long Music Preview Should Use Fast Export First

Experiment: `experiment-003`

Learning: HyperFrames 全量逐帧渲染 4 分钟以上竖屏音乐盘点会很慢，尤其当渲染器降到单 worker 时。长版音乐盘点应先用 ffmpeg 快速拼接预览，确认节奏后再决定是否用 HyperFrames 精修关键段落。

Evidence: HyperFrames 对 282.5 秒工程通过 lint/inspect，但 render 降到 one worker 后帧捕获速度过慢；改用 Chrome headless 渲染 PNG 文案层 + ffmpeg overlay/concat 后，成功导出 `chinese-female-singers-long-chorus-preview.mp4`。

Action: 建立双轨策略：短精修用 HyperFrames；长音乐预览用 ffmpeg 快速导出。当前脚本为 `experiments/experiment-003/render_ffmpeg_preview.sh`。

## 2026-05-10: ffmpeg Text Overlay Needs Chrome PNG Workaround

Experiment: `experiment-003`

Learning: 当前 ffmpeg 没有 `drawtext` 滤镜，也不能直接解码 SVG 作为 overlay 输入。需要先把 SVG 文案层渲染成 PNG，再交给 ffmpeg overlay。

Evidence: `ffmpeg -filters` 没有 `drawtext`；直接用 SVG 输入时报 `Decoding requested, but no decoder found for: svg`。Chrome headless 可以按 1080x1920 生成 PNG overlay。

Action: 需要中文文字叠加时，使用“SVG -> Chrome headless PNG -> ffmpeg overlay”的路径。

## 2026-05-10: Ancient History Shorts Need Object-Level Hooks

Experiment: `experiment-004`

Learning: 中国古代史短视频比宏大朝代叙事更适合“具体物件/场景/争议点”切入，例如青铜爵、荔枝快递、宋朝夜市、元代纸币、乾隆盖章。这样脚本更容易在 15-16 秒内形成钩子、反转和记忆点。

Evidence: Experiment 004 以 10 个小切口完成短视频批量生成，并全部通过 HyperFrames lint、visual inspect、render 和 ffprobe；用户此前反馈上一批公共素材主题不够有吸引力。

Action: 后续历史类选题优先按“一个物件 + 一个反常识钩子 + 一句现实类比”设计，不先按朝代大事表展开。

## 2026-05-10: Bar Race Shorts Need Indicator Smoke Tests

Experiment: `experiment-005`

Learning: World Bank 很适合做国家 Top 动态柱状图，但指标可用性必须先 smoke test；有些看似常见的指标会在 API 中归档或最新年份覆盖不足。视频标题和年份必须跟最终可用帧一致。

Evidence: `EN.ATM.CO2E.KT` 通过 API 返回 archived/deleted；旅游到访数据在 2020 后国家覆盖变稀，因此样片改为 1995-2020。最终 6 条榜单全部通过 HyperFrames lint、visual inspect、render 和 ffprobe。

Action: 后续做数据榜单时先跑指标探测脚本，检查可用年份、国家覆盖、是否含汇总地区，再写标题和旁白。

## 2026-05-10: Single-Singer Specials Work Better as Chaptered Profiles

Experiment: `experiment-006`

Learning: 单个女歌手专题不应该做成“歌曲排名”，更适合做人物弧线或能力切面。张韶涵实验用“欧若拉 -> 隐形的翅膀 -> 亲爱的那不是爱情 -> 遗失的美好 -> 淋雨一直走”形成从清亮辨识度、高音穿透、情歌叙事到后期能量的路径。

Evidence: `angela-zhang-special-preview.mp4` 已导出为 139.52 秒本地样片，五段歌曲各约 26 秒；HyperFrames lint 0/0，inspect 0 layout issues，音频 mean `-18.5 dB`、max `-2.3 dB`。

Action: 后续单歌手专题默认先选 4-6 首代表作，每段 20-30 秒；文案用章节标签和一句判断，不加生硬旁白。下一步可以测试更窄的版本：现场高音版、励志金曲版、情歌叙事版。

## 2026-05-10: One Singer Can Support Multiple Themed Cuts

Experiment: `experiment-007`

Learning: 如果单歌手专题效果好，不必只做一条“代表作混剪”。更好的探索方式是把同一个歌手拆成多个主题切面，例如张韶涵的高音穿透、励志能量、情歌遗憾。这样可以分别测试观众对“声线能力”“情绪价值”“叙事氛围”的反应。

Evidence: Experiment 007 导出了三条本地样片：`angela-voice-power-preview.mp4` 约 3:54，`angela-inspiration-preview.mp4` 约 3:09，`angela-ballad-preview.mp4` 约 3:09。每段歌曲约 45 秒，音频均正常。

Action: 后续音乐专题可以先做 2-3 个主题版本，每个版本 3-5 首歌；确认方向后再进入 HyperFrames 精修、字幕节奏和封面标题测试。

## 2026-05-13: Vocal Difficulty Videos Need Conservative Pitch Language

Experiment: `experiment-008`

Learning: 歌曲演唱难度盘点可以用“参考峰值 + 难点拆解”的形式增强专业感，但在没有正式扒谱、人工校音或可靠 pitch-detection workflow 前，音高文字不能写成绝对结论。

Evidence: 张韶涵 TOP5 demo 使用 `参考峰值：C#6-D6 区间`、`B5-C6 区间` 等保守表述，并在片头/README 标注“非官方谱面结论”。最终视频导出为 `angela-top5-vocal-difficulty-preview.mp4`，时长约 3:30。

Action: 后续音乐科普视频统一使用 `参考峰值`、`约`、`区间` 等口径；如果要发布，需要增加人工听辨、频谱/pitch 曲线或谱面来源校验。

## 2026-05-13: Browser Re-login Can Restore YouTube Clip Downloads

Experiment: `experiment-008`

Learning: YouTube 返回 `Sign in to confirm you're not a bot` 时，不一定是 yt-dlp 安装或命令问题；本次在用户重新登录 Chrome 后，同一批 `--cookies-from-browser chrome --js-runtimes node` 下载任务恢复成功。

Evidence: `download_clips.sh` 初次失败在 bot verification；Chrome 登录刷新后，5 条张韶涵素材均下载到 `sandbox/yt-dlp/clips/experiment-008/`。

Action: 遇到同类失败时先检查 Chrome 登录/cookie 状态，再考虑替换素材或调整下载策略。

## 2026-05-13: Vocal Difficulty Should Match The Singer's Actual Difficulty Profile

Experiment: `experiment-009`

Learning: 杨丞琳这类歌手的难度盘点不适合套用“极限高音女歌手”的叙事。她的有效看点更像是上中音区稳定、轻声位置、哭腔控制、尾段副歌体力和叙事情绪。

Evidence: `rainie-top5-vocal-difficulty-preview.mp4` 使用 `年轮说`、`带我走`、`雨爱`、`匿名的好友`、`暧昧` 五段素材；备注文案强调 B4-C#5、A4-B4 等参考区间与演唱控制，而不是夸张高音。

Action: 后续每位歌手的 TOP5 模板要先判断“难在哪里”，不要把同一套高音话术复用到所有人。

## 2026-05-13: Cap yt-dlp Resolution For Fast Music Previews

Experiment: `experiment-009`

Learning: yt-dlp 默认 `bv*+ba/b` 会优先选更高画质，可能把一段 40 秒测试切片下载/转码成很大的文件。杨丞琳《暧昧》官方 MV 被选到高分辨率源，明显拖慢了测试流程。

Evidence: `暧昧` raw test clip was about 41.68 MiB and download-side transcoding took much longer than the other four clips.

Action: 后续测试脚本可以增加快速预览格式上限，例如优先 `bv*[height<=1080]+ba/b[height<=1080]/b`，正式精修时再放开画质。

## 2026-05-13: Powerhouse Singers Need An Endurance-Oriented Difficulty Lens

Experiment: `experiment-010`

Learning: 张惠妹这类 powerhouse 歌手的难度盘点要强调持续声压、强混声、摇滚咬字、长线支撑和现场体力；如果只写“最高音”，会把她真正难的部分说窄。

Evidence: `amei-top5-vocal-difficulty-preview.mp4` 使用 `三天三夜`、`掉了`、`听海`、`剪爱`、`也许明天` 五段素材；备注文案重点围绕“整段不掉声压”“强声压”“哭腔强混”“尾段推进”和“大歌叙事”。

Action: 后续做强声型女歌手时，TOP 文案优先拆“体力线”和“声压维持”，再补参考峰值。

## 2026-05-15: Deprecated Old Kokoro Narration Preference

Experiment: `experiment-012`

Learning: 旧的 `am_michael` / `zf_xiaobei` Kokoro ONNX 方案已废弃，不再作为项目默认配音标准。

Evidence: 用户在 2026-05-16 明确确认 `tts-local-benchmark` 里的 Kokoro `zm_yunxi` 才是想要的配音标准，并要求删除旧方案避免误导。

Action: 不再使用 `.venv-kokoro-runtime`、`models/kokoro/`、`scripts/tts/kokoro-speak.sh` 或旧 voice-map；默认改用 `config/tts/default-voiceover.json` 和 `scripts/tts/render-default-voiceover.sh`。

## 2026-05-13: 1080p Format Cap Works For Fast Preview Downloads

Experiment: `experiment-010`

Learning: 在快速预览阶段给 yt-dlp 设置 `YTDLP_FORMAT='bv*[height<=1080]+ba/b[height<=1080]/b'` 可以避免无意选到 4K/超高分辨率源，同时保留足够的竖屏预览质量。

Evidence: `experiment-010/download_clips.sh` 加入 1080p 上限后，5 段素材全部成功下载，未再出现单段 40 秒切片被下载成超大 4K 文件的情况。

Action: 后续音乐类 sandbox 实验默认加 1080p 上限；只有进入正式精修或需要高清画面时再放开。

## 2026-05-13: Multi-Singer Difficulty Roundups Need True Difficulty Representatives

Experiment: `experiment-011`

Learning: 多歌手演唱难度组合盘点不能只选“经典代表作”，要选能真正代表该歌手难度画像的歌曲。陶喆《普通朋友》更偏经典度和细腻律动，不足以支撑“最高难度代表”；改成《黑色柳丁》后，摇滚声压、R&B 咬字和 groove 控制更贴合难度主题。

Evidence: 用户直接指出“普通朋友没有很难吧？”，随后 `experiment-011` 将陶喆段改为 `黑色柳丁` 并完成四人版预览。

Action: 后续组合盘点先为每位歌手写一句“难在哪里”，再选歌；如果选曲只是有名但不够难，应主动替换。

## 2026-05-15: Deprecated Old Kokoro Runtime

Experiment: `experiment-012`

Learning: 旧 `kokoro-tts` ONNX runtime 方案会和当前默认配音声线冲突，后续不再保留。

Evidence: 旧方案依赖 `.venv-kokoro-runtime`、`models/kokoro/kokoro-v1.0.onnx`、`models/kokoro/voices-v1.0.bin` 和 `scripts/tts/kokoro-speak.sh`；这些已被删除。

Action: 后续本地无 KEY 配音统一使用 benchmark 验证过的 pip Kokoro + `misaki[zh]` 环境，默认 voice 为 `zm_yunxi`。

## 2026-05-16: Intro-Only Voiceover Should Not Duck The Whole Music Preview

Experiment: `experiment-035`

Learning: 音乐盘点只要求片头读主标题时，不适合直接用全片 voiceover 混音脚本；该脚本会把整条素材原声音量下压，影响后面 5 段歌曲体验。

Evidence: 蔡依林 TOP5 demo 先渲染 source-audio base preview，再只把 2.875 秒 `zm_yunxi` 片头配音混到开头，最终歌曲段保留原素材声音。

Action: 后续“片头几秒有配音、歌曲段保留原声”的任务，使用局部混音方式；只有全片旁白才用通用 ducking 脚本。

## 2026-05-16: Timestamp-Based Contact Sheets Are Safer After Concat

Experiment: `experiment-035`

Learning: 使用 `select=eq(n,...)` 按帧号抽 contact sheet，在 concat 后可能因为时间戳/帧率细节漏掉片头或抽样错位。

Evidence: 蔡依林 TOP5 首次 contact sheet 没有显示片头；改用 `-ss` 固定时间点逐帧抽图再 tile 后，正确覆盖 intro、Top5-Top1 和 closing。

Action: 最终 QA contact sheet 优先按固定时间点抽帧，尤其是含 concat 或混音后重封装的成片。

## 2026-05-16: Export Directory Should Only Keep Final Deliverables

Experiment: `experiment-035`

Learning: 用户希望后续视频任务只保留最终产物，不在 `sandbox/exports/<experiment-id>/` 里留下 base preview 或其他中间 MP4。

Evidence: 蔡依林 TOP5 demo 产出 base preview 和最终 preview 两个 MP4 后，用户要求“下次记得只保留最终产物”。

Action: 后续中间 MP4 放到 work directory，或最终混音/封装完成后删除；交付目录只保留最终 preview MP4 和 contact sheet。

## 2026-05-16: Chinese Kokoro TTS Mangled Raw TOP5

Experiment: `experiment-035`

Learning: 当前默认 `zm_yunxi` 中文配音不应直接朗读 `TOP5` / `TOP10` 这类英文缩写加数字。Kokoro 的中文管线会把 `TOP5` 解析得不稳定，可能丢掉数字并生成奇怪尾音。

Evidence: 蔡依林 TOP5 demo 首版片头读稿为 `蔡依林最难的歌，TOP5。`，用户听到“蔡依林最难的歌，”后接近奇怪 `zhong` 的尾音，没有读出完整 `TOP5`。音素检查显示 `TOP5` 被解析成类似 `TOPu`，数字未稳定进入读音。

Action: 后续中文 TTS 读稿遇到 `TOP5/TOP10/Top 5/Top10` 时，送入 TTS 的文本统一改成 `前五名/前十名` 等中文可控读法；画面标题可以继续写 `TOP5/TOP10`。配音 QA 除了检查文件存在，还要检查 manifest 里是否有未规范化的英文缩写+数字。

## 2026-05-16: Sun Nan Difficulty Copy Should Emphasize Pressure And Thickness

Experiment: `experiment-033`

Learning: 孙楠这类男声高压难度盘点不适合只写“飙高音”。更贴切的角度是亮硬高音、持续声压、厚度、穿透力、真假声转换和后段续航。

Evidence: `sun-nan-top5-vocal-difficulty-preview.mp4` 使用《不见不散》《风往北吹》《你快回来》《燃烧》《拯救》五段素材，文案分别强调高位咬字、厚度上推、呼喊穿透、瞬间飙升和声压硬顶。

Action: 后续男声难度盘点先判断“高压厚声型、控制型、R&B律动型、咬字型”等难法，再写对应文案，避免套用单一最高音模板。

## 2026-05-13: TOP Ranking Videos Should Count Down To Top 1

Experiment: `experiment-008` to `experiment-011`

Learning: TOP 排名类短视频如果一开始就放 Top1，会提前释放最大悬念，后面容易失去观看动力。更合理的结构是从 Top N 倒序推进，把 Top1 留到最后揭晓。

Evidence: 用户反馈“你的TOP排名应该是倒过来才合理，如果第一个就是Top1，没有神秘感了”。

Action: 后续 `TOP5`、`TOP10` 等明确排名视频，剪辑 brief 和渲染顺序默认从低到高倒序：Top5 -> Top4 -> Top3 -> Top2 -> Top1。非排名专题则不要硬套 Top 编号，可用章节名或能力标签。

## 2026-05-15: User-Ranked Music Lists Should Preserve Ranking But Reverse The Reveal

Experiment: `experiment-012`

Learning: 用户给出 1-5 的主观排名时，语义上要尊重用户的 Rank 1/2/3，但成片叙事上要倒序揭晓。也就是说，内部记录保留用户原始排名，剪辑和字幕则输出 Top5 -> Top1。

Evidence: 张韶涵冷门歌曲 TOP5 中，用户给出的 Top1 是《伤日快乐》；最终 demo 按 `失忆 -> 幻想爱 -> 城市之窗 -> 绝不 -> 伤日快乐` 输出，抽帧确认倒序成立。

Action: 后续 brief 同时记录 `User Ranking` 和 `Edit Order`，避免排序语义和剪辑顺序混淆。

## 2026-05-15: Difficulty Copy Should Be Compressed Into Listen-First Labels

Experiment: `experiment-013`

Learning: 用户提供的演唱难度描述往往很有价值，但直接铺满屏会挤压素材本身。更适合压缩成一条 `参考难点` 和两句解释，让观众先听到高难度段落，再用文字理解为什么难。

Evidence: 陶喆 TOP5 demo 使用用户原始排序和难点判断，但文字层压缩为 `持续 High C 强咬字`、`连续强混高音`、`真假声极速切换` 等短标签，抽帧显示没有遮挡主体画面。

Action: 后续音乐科普类 TOP 视频，先保留用户原始长描述到实验 README/brief，再把成片文字层压成短标签；需要正式发布时再增加音高或乐理来源校验。

## 2026-05-15: Deep-Cut Song Roundups Work Better With Credits Than Lyric Quotes

Experiment: `experiment-012`

Learning: 冷门歌盘点的看点是“歌单判断 + 副歌回忆感”，画面文案不需要解释过多。歌名、作词、作曲和来源足够建立信息密度，同时避免大段歌词引用带来的版权和画面拥挤问题。

Evidence: `angela-deep-cuts-top5-preview.mp4` 只使用 rank、歌名、作词、作曲和一句短备注，抽帧看起来比长文案更干净。

Action: 后续冷门歌/宝藏歌盘点默认采用短 metadata overlay；除非用户明确要赏析，否则不放歌词句子。

## 2026-05-15: Live Sources Can Be Better For Vocal-Difficulty Evidence

Experiment: `experiment-014`

Learning: 演唱难度盘点不一定总是优先录音室 MV。像《脚本》这种难点集中在换声点、强混和真假转换的歌，官方 live 版本更能呈现真实演唱压力；但要在来源记录中说明为什么使用 live，而不是默认当作 studio source。

Evidence: `experiment-014` 中《脚本》选择王力宏官方福利秀现场，抽帧和音频检查正常；相比非官方 lyric upload，它更符合“难度最高片段”的实验目标。

Action: 后续每首歌选源时同时判断“官方性”和“难点可见/可听性”。如果 live 更能证明难度，就使用官方 live，并在 source log 标明取舍。

## 2026-05-15: Countdown Logic Should Not Leak Into The Visible Title

Experiment: `experiment-012`

Learning: TOP 视频可以在剪辑结构上倒序揭晓，但标题应该面向观众表达主题本身，例如 `张韶涵冷门歌曲 TOP5`。不要把“倒数”“倒序”这类内部剪辑逻辑写进片头标题。

Evidence: 用户指出“不要带‘倒数’2个字，这种是约束逻辑，不适合放在标题处”。

Action: 后续标题只写选题和榜单类型；倒序规则保留在 brief、脚本和剪辑顺序里。

## 2026-05-13: DVIDS Range Clips Need Contact-Sheet Vetting

Experiment: `modern-firearms-classics`

Learning: DVIDS 公共领域素材适合军事装备科普本地测试，但同一条 range b-roll 里常有片头黑卡、远景或非目标武器画面。下载后必须先做 contact sheet，再决定是否替换时间段或换同主题 B-roll。

Evidence: 初始 M249、M4、AK-47 片段视觉不够清晰；通过 contact sheet 后替换为 `M249 range b-roll`、M4 E2B close-up B-roll，并改用 AK-47 同源后半段，最终成片每段都能看到对应枪械。

Action: 后续装备盘点类视频下载后先抽帧成图，再进 HyperFrames；不要只凭标题判断片段里目标装备足够清楚。

## 2026-05-13: Re-encode DVIDS Clips Before HyperFrames Render

Experiment: `modern-firearms-classics`

Learning: DVIDS 切片也会出现关键帧稀疏提示。进入 HyperFrames 前，把选中的项目内素材重编码为 30fps、短 GOP 的 H.264/AAC，可以消除 seek/frame freeze 风险。

Evidence: 首次 render 对五段素材均提示 sparse keyframes；重编码成 `*-edit.mp4` 并更新 `index.html` 后，最终 render 不再出现关键帧稀疏警告。

Action: `yt-dlp` 切片通过视觉筛选后，统一生成 HyperFrames-friendly edit assets，再渲染最终成片。

## 2026-05-15: Theme Lists Should Use Mood Labels Instead Of Ranking Language

Experiment: `experiment-015`

Learning: 用户给的是主题歌单而不是明确名次时，成片不需要硬套 `Top5 -> Top1`。更自然的结构是保留用户给定顺序，用 `01-05`、风格标签和短句让观众理解每首歌的甜感差异。

Evidence: `rainie-sweet-songs-preview.mp4` 用 `元气欢快`、`俏皮律动`、`软萌清新`、`青涩恋爱`、`温柔清甜` 串起五首歌，避免了不必要的排名感。

Action: 后续先判断选题是“排名”还是“主题清单”。排名才倒序揭晓；主题清单保留用户顺序，用章节名、情绪标签或能力标签组织。

## 2026-05-15: Keep Internal Workflow Words Out Of Visible Video Copy

Experiment: `experiment-015`

Learning: 用户明确提醒视频文案不要带项目约束或提示词类内容。内部规则可以写进 README、brief、memory，但不能进入片头、字幕、转场或结尾文案。

Evidence: 本轮 contact sheet 检查确认画面只出现观众能理解的标题、歌名、风格标签和短备注，没有出现 prompt、sandbox、项目约束或实验说明。

Action: 后续渲染前把 visible copy 单独列出并快速扫一遍；内部执行词只保留在本地文档中。

## 2026-05-15: Official Audio Can Be Better Than Unofficial Lyric Video

Experiment: `experiment-016`

Learning: 音乐难度盘点的核心证据是声音。某些歌没有理想官方 MV 或官方 MV 不容易找到时，优先选择歌手官方频道音频源，比使用非官方歌词版更稳；画面不足可以通过竖屏包装、封面适配和信息层补足。

Evidence: 《无法克制》搜索结果里有非官方歌词版和现场版本，但最终使用林俊杰官方频道音频源 `CEqwRGpHINc`，保证声音来源可靠。

Action: 后续选源时按 `官方 MV > 官方 live > 官方 audio > 可信授权源 > rights_review 备用源` 排序；如果选官方 audio，要在 source log 说明原因。

## 2026-05-15: Sweet-Song Ranking Copy Should Stay Emotional, Not Technical

Experiment: `experiment-018`

Learning: 甜歌盘点和演唱难度盘点的文字逻辑不同。甜歌榜单更适合用“元气”“清新”“俏皮”“热恋”“温柔”等情绪标签，避免套用音高、换声、强混等技术语言。

Evidence: `angela-sweet-songs-top5-preview.mp4` 用 `热恋甜味`、`温柔明朗`、`清新明媚`、`俏皮恋爱`、`元气少女` 串起五首歌，抽帧确认信息清楚且不挤压画面。

Action: 后续先判断音乐盘点属于“听感/情绪”还是“唱功/难度”。听感类用短情绪标签；难度类才用参考难点和乐理拆解。

## 2026-05-15: Jay Chou Difficulty Copy Needs Diction And Emotion Pressure

Experiment: `experiment-019`

Learning: 周杰伦难度盘点如果只写“最高音”会失真。他的难点常在高位咬字、压抑哭腔、真假声边缘、尾段持续输出和情绪稳定度。文字层更适合用 `参考难点 + 两句具体听感/唱法压力`。

Evidence: `jay-chou-top5-vocal-difficulty-preview.mp4` 按《黑色幽默》《一路向北》《枫》《搁浅》《白色风车》倒序呈现，观众向文字分别强调真假声转换、哭腔、升Key耐力、持续高音和温柔高音耐力。

Action: 后续周杰伦相关难度视频不要默认寻找绝对最高音片刻；优先找最能体现咬字、情绪和续航综合压力的段落。

## 2026-05-15: Angela Difficulty Lists Can Be Recut Without Reusing The Old Canon

Experiment: `experiment-020`

Learning: 张韶涵“最难”歌单可以根据用户提供的新排名重新建立，不必沿用早先 `experiment-008` 的《不痛》《呐喊》《寓言》《欧若拉》。如果用户明确给出曲目和描述，优先尊重该排名，再按倒序揭晓。

Evidence: `angela-2026-top5-vocal-difficulty-preview.mp4` 使用用户指定的《引路的风筝》《无度》《全面沦陷》《破茧》《阿刁》，并把文字拆成明亮高位、暗色推进、轻快体能局、爆发穿透、换声区强混五种难法。

Action: 后续单歌手难度视频先判断用户是否提供了确定歌单；有确定歌单时，只把历史实验作为来源和脚本参考，不覆盖用户排名。

## 2026-05-16: Dance-Pop Difficulty Needs Rhythm And Breath Language

Experiment: `experiment-021`

Learning: 萧亚轩这类唱跳型歌手的“难唱”不能只写高音。更贴近观众听感的拆法是快歌咬字、律动重拍、断句气息、低音质感、换声点和克制情绪。

Evidence: `elva-top5-vocal-difficulty-preview.mp4` 把《不爱请闪开》《类似爱情》《遗失的心跳》《表白》《最熟悉的陌生人》分别标为快歌攻击性、细腻推高、高位续航、唱跳气息、换声点情绪。接触图确认可见文案没有落入单一高音逻辑。

Action: 后续唱跳歌手难度视频应优先描述 `节奏 + 气息 + 咬字 + 稳定度`，高音只作为其中一个维度。

## 2026-05-16: Retry Split-Stream EOF With Muxed Format

Experiment: `experiment-021`

Learning: yt-dlp 下载 YouTube 分轨切片时，音频流偶发 EOF 可以通过更保守的合并格式重试解决。

Evidence: `遗失的心跳` 初次使用 `399-sr+251` 在音频输入阶段 EOF；改用 `YTDLP_FORMAT='18/b[height<=720]/bv*[height<=720]+ba/b'` 后成功下载同一时间段。

Action: 后续遇到单段分轨 EOF，先保留同一官方 URL 和切点，改用 muxed/lower format 重试，再考虑换源。

## 2026-05-16: Creator Roundups Need Credit-First Copy

Experiment: `experiment-022`

Learning: “某制作人为别人创作的歌”不是演唱难度视频，文案核心应是演唱者、作词、作曲和创作辨识度。不要套用 `参考难点`、音高或唱法压力语言。

Evidence: `david-tao-songs-for-others-top5-preview.mp4` 使用 `轻R&B侧面`、`少女团律动`、`时代合唱`、`洒脱快歌`、`痞气R&B` 串起五首歌，并在每段明确列出词曲署名。

Action: 后续做创作者/制作人作品盘点时，先建立 credit 表，再写 visible copy；公开资料冲突时，采用不漏署名的保守合并口径，并把争议写进实验文档。

## 2026-05-16: Long Song Titles Need A Smaller Overlay Font

Experiment: `experiment-023`

Learning: 创作者作品盘点会遇到长歌名，例如《有没有一首歌会让你想起我》。如果沿用 64px 歌名字号，竖屏下方信息层可能显得太挤。

Evidence: `steve-chou-songs-for-others-top5-preview.mp4` 将歌名字号调到 58px，接触表确认 Top1 长标题、演唱者、词曲和说明都能容纳。

Action: 后续有 10 字以上中文歌名或中英混排歌名时，先在渲染脚本中调小 song 字号，或拆成两行标题再生成接触表检查。

## 2026-05-16: Keep A Non-Browser Overlay Fallback

Experiment: `experiment-024`

Learning: Chrome headless 或本机权限不可用时，音乐盘点预览仍可以用 Pillow 生成 PNG 文字层，再交给 ffmpeg 叠加和拼接。这个路径少依赖浏览器，更适合快速本地 demo。

Evidence: `jj-lin-songs-for-others-top5-preview.mp4` 首次 Chrome overlay 渲染被权限/用量限制阻断；切换为 `render_top5_preview_pillow.py` 后成功导出 1080x1920、约 5 分 02 秒的本地预览，contact sheet 确认可见文案正常。

Action: 后续快速预览优先保留两个渲染路径：HyperFrames/Chrome 用于精修，Pillow + ffmpeg 用于权限受限或只需确认节奏的本地实验。

## 2026-05-16: Reusable Pillow Renderer Speeds Up Creator TOP5 Videos

Experiment: `experiment-025`

Learning: 创作者 TOP5 音乐盘点已经形成稳定结构：五段官方源副歌、倒序揭晓、统一竖屏包装、词曲署名和一句记忆标签。把 Pillow + ffmpeg 渲染逻辑抽成通用模块后，新实验只需要维护歌曲 manifest，能减少复制和出错。

Evidence: `tank-songs-for-others-top5-preview.mp4` 使用 `scripts/video/pillow_top5_renderer.py` 成功导出 1080x1920、约 5 分 33 秒预览；抽帧确认 Top5 到 Top1 顺序、歌名、演唱者和词曲署名都正常。

Action: 后续同类 `为别人创作的歌TOP5` 优先复用通用 renderer；只有需要更复杂动效时再回 HyperFrames/Chrome 精修。

## 2026-05-16: Short Titles Should Only Break At TOP5

Experiment: `experiment-026`

Learning: 盘点视频片头标题要尽量短，倒序逻辑不能写进标题；如果标题需要分行，只有 `TOP5` 这类排名标识适合单独换行。结尾提问也要用短标题，长问题放到小字副标题里。

Evidence: 用户指出“标题简短点，只有TOP5可以换行”。`male-singers-girl-heart-top5-preview.mp4` 调整为片头 `男歌手写少女心神曲` + `TOP5`，结尾大标题改为 `哪首最意外？`，contact sheet 确认不再挤压。

Action: 后续 TOP 视频渲染前先检查片头和结尾大标题长度；大标题只放最核心的短句，解释性内容转入副标题或 lower third。

## 2026-05-16: Cover Roundups Need A Motion Check

Experiment: `experiment-027`

Learning: 经典翻唱/现场盘点不能只看来源是否官方，还要确认画面是否真有现场运动。官方频道可能提供的是静态封面音频，适合听但不适合“现场片段”型短视频。

Evidence: 林忆莲官方频道 `20i4yv4h4cU` 标题为 live，但抽帧显示偏静态封面；改用同场现场上传源 `YXTf5wVacfg` 后，contact sheet 确认 Top2 段落有实际舞台画面。

Action: 后续音乐现场盘点下载后先看 contact sheet；如果源是静态图或画面信息不足，优先替换为更符合现场语境的版本，并在 source_candidates 里保留替换原因。

## 2026-05-16: Live Fail Roundups Need Gentle Framing

Experiment: `experiment-028`

Learning: “翻车名场面”类视频容易变成攻击型内容，文案必须把焦点放在真实 live 的不可控、救场、互动和时代感上，而不是贬低歌手。可用 `意外`、`话筒乌龙`、`互动翻车`、`真唱考古`、`救场`，避免侮辱性表达。

Evidence: `mandopop-live-oops-top5-preview.mp4` 使用 `救场变互动梗`、`互动翻车`、`梦幻同台争议点`、`话筒乌龙`、`真唱考古` 五个标签；文案检查排除了攻击性词汇和内部流程词。

Action: 后续轻吐槽盘点先写 tone guard，再写 visible copy；导出前用关键词扫描检查是否出现侮辱性、恶意或内部流程用语。

## 2026-05-16: Retry YouTube DNS Failures Before Replacing Sources

Experiment: `experiment-028`

Learning: yt-dlp 下载时偶发 `Failed to resolve 'www.youtube.com'` 不一定代表链接失效；同一链接稍后单独重试可以成功。

Evidence: 李玟 `ThR4kOGHYpI` 首轮批量下载因 DNS 解析失败，单独重试后成功下载同一切点。

Action: 遇到 YouTube DNS 解析失败时，先保留原 URL 和切点，等待片刻后单独重试；连续失败再考虑换源。

## 2026-05-16: Eason Difficulty Is Mostly Control, Not Only High Notes

Experiment: `experiment-029`

Learning: 陈奕迅难唱歌盘点不能只围绕最高音写文案；更有说服力的拆法是控制型难度，包括真假声边缘、长句气息、粤语咬字、强弱变化、戏剧表达和尾段续航。

Evidence: `eason-top5-vocal-difficulty-preview.mp4` 中《反高潮》《一丝不挂》《时代巨轮》并不是单纯炫高音，但都适合用“气息、节奏、强弱和控制”解释难点；《浮夸》则把高音爆发和戏剧张力合在一起作为 Top1。

Action: 后续做陈奕迅、张学友、林宥嘉这类“控制型男声”难度盘点时，先按“难法标签”写 lower third，再决定是否需要标注音高，避免只有高音排名的单薄感。

## 2026-05-16: Faye Wong Difficulty Needs Light-Control Language

Experiment: `experiment-030`

Learning: 王菲难度盘点不适合写成“飙高音”逻辑，更有辨识度的是轻控制：气声、真假声边缘、虚实音色、游离节奏、吟唱音准和情绪克制。

Evidence: `faye-wong-top5-vocal-difficulty-preview.mp4` 中《新房客》《百年孤寂》《浮躁》都不是传统爆发型难歌，但听感越轻，越需要音准、气息和音色的精细控制；《半途而废》则把快节奏咬字和真假声切换作为 Top1。

Action: 后续做王菲、林忆莲、陈绮贞这类轻控制女声时，先写“难法标签”，避免把文案套成高音竞赛；如果官方旧 MV 清晰度不足，可保留官方音频源，并在二版考虑替换更有画面信息的现场源。

## 2026-05-16: A-Mei Difficulty Needs Sustained-Pressure Language

Experiment: `experiment-031`

Learning: 张惠妹难度盘点的重点不是单个最高音，而是高压持续输出：低高音跨度、连续呐喊、Bridge 气息、后段嘶吼、戏剧张力和情绪爆发同时存在。

Evidence: `amei-top5-vocal-difficulty-preview.mp4` 中《彩虹》《这样你还要爱我吗》《血腥爱情故事》都更适合用持续声压、气息续航和情绪控制来解释难度；《如果你也听说》则证明细腻推进也可以成为难点。

Action: 后续做张惠妹、彭佳慧、黄小琥这类大嗓女声时，先写“持续压力 + 控制维度”的 lower third，避免只截一个高音瞬间或只写飙高。

## 2026-05-16: Disable Subtitles When Subtitle Retrieval Hits HTTP 429

Experiment: `experiment-031`

Learning: YouTube 可能只在字幕下载阶段返回 HTTP 429，但视频切片仍可正常下载。此时不必立刻换源，可以保留同一 URL 和切点，关闭字幕下载后重试。

Evidence: Top1《彩虹》`OvlWgjiQYpo` 首次下载在 subtitle retrieval 阶段报 HTTP 429；使用同一时间段禁用字幕下载后成功得到 MP4 片段，并完成预览导出。

Action: 后续下载脚本可以为字幕非必要的音乐盘点提供 no-subtitle fallback；异常要写入 `run_log.md` 和 `.learnings/ERRORS.md`，便于跨对话继承。

## 2026-05-16: Fish Leong Difficulty Needs Gentle-Control Language

Experiment: `experiment-032`

Learning: 梁静茹难度盘点不适合写成大嗓高音竞赛。更贴合她的难点是温柔控制：清透高位、真假声边缘、气息线条、音准细节和情绪层次。

Evidence: `fish-leong-top5-vocal-difficulty-preview.mp4` 中《情歌》《崇拜》更依赖细节稳定和情绪推进，《丝路》《燕尾蝶》才更明显进入大歌副歌和高位爆发；五首歌的难法不是同一种。

Action: 后续做梁静茹、孙燕姿、范玮琪这类清透女声时，先写“控制维度”而非“飙高音”，用 `稳`、`清透`、`气息线条`、`真假声衔接` 解释观众听得到的难点。

## 2026-05-16: Official Topic Audio Can Be A Preview Fallback

Experiment: `experiment-032`

Learning: 某些经典歌曲在 YouTube 上官方 MV 不容易找到，官方 artist/Topic 音频源可以先作为本地预览的声音优先方案，但要在实验记录里标明画面运动有限。

Evidence: 《情歌》和《崇拜》使用 `梁靜茹 Fish Leong` artist/Topic 源，声音干净但画面偏静态；竖屏包装和 contact sheet 仍能完成本地节奏验证。

Action: 后续如果用户反馈画面太静，再从备选表替换为非官方 MV、现场或更有画面信息的来源；首版 demo 则优先保证声音和切点。

## 2026-05-16: Cross-Conversation Defaults Need A Local Contract

Experiment: project-wide

Learning: 只靠长对话上下文会让新会话存在漂移风险，尤其是默认写入 `sandbox/`、个人本地测试版权口径、TOP 倒序、无配音、原声优先、标题换行规则和可见文案黑名单。

Evidence: 用户明确担心新开对话后会丢失“不要写到非 sandbox 目录”“这是个人测试用途不是商业行为”等细节。本轮已把这些规则写入 `AGENTS.md` 和 `memory/video-production-contract.md`，并同步到 README、docs 和 decisions。

Action: 后续新对话开始制作视频前，先读 `AGENTS.md`、`memory/video-production-contract.md`、`memory/project-state.md`、`memory/learnings.md` 和 `DESIGN.md`。如果继续某个实验，再读对应 run log、demo output、source candidates 和 brief。

## 2026-05-16: Kokoro Is The Current Local Chinese TTS Baseline

Experiment: `tts-local-benchmark`

Learning: 在本机 macOS / Apple Silicon 环境里，Kokoro pip + `misaki[zh]` 是当前最容易跑通的免费本地中文 TTS；其中用户认可的唯一默认配音声线是 `zm_yunxi`，只要需要配音就使用它，不要求用户强调“男声”。MeloTTS、ChatTTS-ui、CosyVoice、GPT-SoVITS、IndexTTS2 更依赖 Python 3.10+、conda、uv、git-lfs 或完整模型下载。

Evidence: Kokoro 生成 13 条中文 wav 和对应 demo mp4；用户试听后确认 videos 目录里的 `zm_yunxi` 符合想要的配音标准，并补充“即使不强调男也应该用这个声音”。MeloTTS/ChatTTS-ui 安装后推理或服务卡住，CosyVoice/GPT-SoVITS 被 conda/Python 版本阻断，IndexTTS2 被 git-lfs/uv 阻断。

Action: 自动剪辑旁白默认使用 `config/tts/default-voiceover.json` 中的 `zm_yunxi`，通过 `scripts/tts/render-default-voiceover.sh` 生成；需要直接给视频加旁白时用 `scripts/tts/voiceover-video.sh`。要验证更高自然度或固定音色时，先补齐 conda、uv、git-lfs，并用 Python 3.10/3.11 建独立环境。

## 2026-05-16: Hang-To-La With Default TTS Needs A Roomier Timeline

Experiment: `experiment-034`

Learning: 当前默认 `zm_yunxi` 配音比旧的“从夯到拉”测试声线自然但更慢。9 个条目加开头和结尾，如果保持逐对象揭晓，约 56 秒比 46 秒更适合口播和画面对齐。

Evidence: 首次按 46 秒 SRT 生成时，后续 cue 被前句自然语速推迟，最终音频约 53.45 秒且多处 overrun；改成 56 秒时间线后最大 overrun 降到约 0.37 秒，contact sheet 中条目揭晓节奏正常。

Action: 后续“从夯到拉”程序化榜单默认按 `4-5 秒开头 + 每条 4-5 秒 + 8 秒结尾` 估算时长；若要压到 45 秒以内，应减少条目或主动提高 TTS speed，而不是硬塞 9 个条目。
