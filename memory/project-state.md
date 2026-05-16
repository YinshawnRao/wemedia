# Project State

Last updated: 2026-05-16

## Current Phase

初始化实验阶段。目标不是马上量产，而是跑通一条短视频生产链路。默认所有音乐盘点都是个人本地测试 demo，输出保持在 `sandbox/`，不进入正式素材库：

```text
创意 -> 素材来源 -> 测试下载 -> 剪辑 brief -> HyperFrames demo -> QA 复盘
```

新对话开始制作视频前，必须读取 `AGENTS.md` 和 `memory/video-production-contract.md`，再继续当前实验节奏。

## Active Experiment

- Experiment: `experiment-033`
- Direction: 孙楠最难的5首歌
- Candidate topic: 用户提供孙楠 5 首高难度歌曲排名，按 Top5 -> Top1 揭晓；每段取最能体现演唱难点的片段，保留素材原声，叠加排名、歌名、歌手和演唱难点说明。
- Status: 已完成 1 条本地预览 demo；5 个片段各约 34 秒，整体约 3 分钟。

## Next Step

查看孙楠最难的歌 TOP5 demo，判断每首歌切点是否真正命中“最难段落”，尤其 Top1《拯救》的后段持续声压、Top2《燃烧》的真假声与高点段，以及《风往北吹》使用歌词视频源、《燃烧》《拯救》使用 Topic 音频源的画面静态程度是否可接受：

```text
sandbox/exports/experiment-033/sun-nan-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-033/sun-nan-top5-vocal-difficulty-contact-sheet.jpg
```

## Important Runtime Notes

- yt-dlp version: `2026.03.17`
- ffmpeg version: `8.0.1`
- node version: `v25.8.0`
- deno: not installed
- YouTube 下载默认使用 `--cookies-from-browser chrome --js-runtimes node`
- 曾因误拒 Chrome 权限导致 `--cookies-from-browser chrome` 无法解密 cookies；重新允许权限后已成功读取 1728 cookies。
- 手动 cookies 文件不作为当前主流程。
- 初期测试默认使用 `WEMEDIA_OUTPUT_MODE=test`
- 音乐盘点类 demo 默认优先验证素材原声、节奏包装和版权边界；如果用户明确要求配音/旁白/解说/口播/读稿/有声音，自动启用当前项目默认配音声线，不再询问声音选择。
- 当前本地无 KEY 配音标准：`tts-local-benchmark` 里用户认可的 Kokoro `zm_yunxi`。配置为 `config/tts/default-voiceover.json`，生成入口为 `scripts/tts/render-default-voiceover.sh`，混音入口为 `scripts/tts/add-voiceover.sh`，一步式视频配音入口为 `scripts/tts/voiceover-video.sh`。
- 旧 Kokoro ONNX runtime 已废弃并清理；不要再使用 `.venv-kokoro-runtime`、`models/kokoro/`、`scripts/tts/kokoro-speak.sh`、`am_michael`、`zf_xiaobei` 或旧 voice-map。
- 音乐盘点如果要听副歌/Hook，每段 6 秒太短；当前经验是每段至少 25-30 秒。
- HyperFrames 适合短视频精修；4 分钟以上长音乐盘点可先用 ffmpeg 快速预览，再决定是否回 HyperFrames 做精修。
- 单歌手专题比“多人名单式盘点”更适合做人物弧线；当前实验用五首歌覆盖早期辨识度、高音、情歌、遗憾感和后期能量。
- 张韶涵系列进一步验证了“一个歌手，多条主题线”更容易迭代：高音穿透、励志能量、情歌遗憾可以分别测试，不必挤进同一条视频。
- 2026-05-13 Chrome 重新登录后，YouTube cookies 下载恢复正常；如果再次出现 `Sign in to confirm you're not a bot`，优先确认浏览器登录状态和 cookies 是否可读取。
- 音乐科普类的音高标注必须保守表达；在没有正式扒谱或可靠 pitch workflow 前，统一用 `参考峰值`，不要写成官方或绝对结论。
- 杨丞琳这类演唱难度盘点不能只靠“最高音越高越难”；更适合拆解上中音区稳定度、长句气息、轻声位置、真假声边缘和情绪控制。
- yt-dlp 默认 `bv*+ba/b` 可能选到 4K/超高分辨率源，导致短切片也很慢；后续快速预览可考虑给测试脚本加高度上限。
- 张惠妹这类歌手的 TOP5 适合强调持续声压、强混声爆发、摇滚咬字、长线支撑和体力，而不只是单个最高音。
- `experiment-010` 的下载脚本已用 `YTDLP_FORMAT='bv*[height<=1080]+ba/b[height<=1080]/b'` 限制测试素材高度，预览速度更可控。
- 组合式男歌手难度盘点更适合按“难法不同”来组织，而不是硬做跨歌手绝对排名；周杰伦偏高位咬字，王力宏偏强混和大跳，陶喆偏 groove/声压/R&B 咬字，林俊杰偏高位长线稳定。
- 用户指出陶喆《普通朋友》不太适合“最高难度代表作”后，`experiment-011` 改为《黑色柳丁》；后续多歌手难度盘点不要只选经典度高的歌，要选最能代表难度画像的歌。
- `experiment-012` 验证了用户自定义排名 + 倒序揭晓的音乐盘点结构；即使用户给的是 1-5 正序，成片也应转为 Top5 -> Top1。
- 冷门歌盘点的文字层不必讲太多，保留歌名、作词、作曲、来源即可，让副歌本身承担记忆点。
- yt-dlp 并行搜索在沙盒中可能触发 `Failed to initialize sync semaphore`；后续 yt-dlp 搜索/下载优先顺序执行，必要时走本机授权。
- 用户提供专家向描述时，可以压缩成 `参考难点 + 两句解释` 的文字层；不要逐字堆满屏幕。
- `experiment-013` 中《不爱》的官方 YouTube metadata 显示为 `Forever`，但作为用户指定的《不爱》素材使用；后续复盘要保留这个来源别名。
- `experiment-014` 中《脚本》使用官方 live 版本比非官方歌词视频更能体现换声点和强混压力；如果用户要录音室质感，再对比官方 karaoke/video 源。
- 王力宏这类男高音/强混盘点适合把 Top1 段落留长一点，让连续高音堆叠真正听出来，而不是只截一个最高音瞬间。
- 主题歌单视频如果不是明确排名，不要硬写 `Top` 或倒序逻辑；可按用户给定顺序使用 `01-05` 和情绪/风格标签。
- 成片可见文案必须始终面向观众，不要露出项目约束、提示词、实验目录、sandbox、内部 workflow 等词。
- `experiment-015` 中《甜心咒》第一次下载遇到音频流 EOF，改用较低/合并 HLS 格式后成功；后续遇到单轨失败可以先换 muxed/lower format 继续试跑。
- `experiment-016` 中《无法克制》优先使用林俊杰官方频道音频源，而不是非官方歌词版；音乐难度盘点应优先保证声音来源可靠，画面素材不足可用竖屏包装弥补。
- `experiment-016` 输出音量峰值约 -4.5 dB，声音较保守；如果用户希望更贴近短视频平台响度，可在二版里轻微提响并重新做 volumedetect。
- `experiment-018` 五首均使用福茂唱片官方 MV；老 4:3 MV 适合继续用模糊背景 + 主体居中的竖屏包装，避免硬裁掉人物。
- 甜歌排名的文字层应突出情绪标签和听感，不要误写成演唱难度或音高科普。
- `experiment-019` 五首均使用周杰伦官方频道 MV。周杰伦难度盘点不要只写最高音，应强调高位咬字、压抑哭腔、真假声边缘、尾段续航和情绪稳定。
- `experiment-020` 张韶涵新难度歌单不再沿用旧 `experiment-008` 的曲目；只复用《阿刁》的官方舞台源经验。张韶涵难度文案适合强调强混、换声区、穿透、明亮度、体能和叙事稳定。
- `experiment-021` 萧亚轩难度视频应突出唱跳律动、快歌咬字、气息切分、低音质感和换声点情绪控制，不要只按传统高音逻辑写。
- `experiment-022` 创作者作品盘点应从“演唱难度文案”切换到“词曲署名 + 创作辨识度 + 听感标签”；如果公开 credit 有多种写法，优先使用不漏署名的保守合并写法，并在实验文档说明。
- `experiment-023` 周传雄作品盘点适合突出 KTV 情歌、台偶 OST、都市苦情和集体回忆；长歌名需要提前调小标题字号，避免覆盖或出框。
- `experiment-024` 林俊杰作品盘点已完成本地预览，使用纯本地 Pillow PNG overlays + ffmpeg 作为 Chrome headless 不可用时的安全 fallback；成片约 5 分 02 秒，音量峰值约 -1.5 dB。
- `experiment-025` 把 Pillow + ffmpeg 预览渲染抽成 `scripts/video/pillow_top5_renderer.py`，后续创作者 TOP5 只需写实验脚本和 clip manifest；Tank 成片约 5 分 33 秒，音量峰值约 -2.0 dB。
- `experiment-026` 验证了 5 首歌各约 32 秒的创作者/反差萌盘点节奏，整体约 2 分 50 秒，比 5 分钟长盘点更紧凑；标题必须短，只有 `TOP5` 可以作为大标题单独换行。
- `experiment-027` 经典翻唱对比视频要先做画面运动检查；林忆莲官方频道源是静态封面音频，预览版改用同场现场上传源，避免现场盘点变成静态图。
- `experiment-028` 轻吐槽/翻车盘点需要把语气控制在“意外、乌龙、互动、救场、考古”范围，避免侮辱性和绝对化攻击；素材源会更杂，下载后必须用 contact sheet 快速判断是否命中代表瞬间。
- `experiment-029` 陈奕迅难度盘点适合强调“控制型难度”：真假声边缘、长句气息、咬字味道、强弱反差、戏剧张力和体力续航；不要把文案写成只看最高音的单一标准。
- `experiment-030` 王菲难度盘点适合强调“轻控制”：气声、真假声边缘、音色虚实、游离节奏、吟唱音准和情绪克制；旧 MV 清晰度有限时，优先保证官方音频源和文字层可读。
- `experiment-031` 张惠妹难度盘点适合强调“高压持续输出”：低高音跨度、连续高强度呐喊、Bridge 气息、后段嘶吼、戏剧张力和情绪爆发；文案要让观众听出体力和控制的双重压力。
- YouTube 字幕下载可能单独触发 HTTP 429；如果视频切片本身可下载，可保留同一 URL 和切点，关闭字幕下载后先完成本地预览，再把异常写入 run log。
- `experiment-032` 梁静茹难度盘点适合强调“温柔控制型”：清透高位、真假声边缘、气息线条、音准细节和情绪层次；不要把文案写成大嗓高音竞赛。
- 当官方 MV 不好找时，官方 artist/Topic 音频源适合作为声音优先的本地预览方案；如果用户看重画面运动，二版再替换 MV 或现场备选。
- `experiment-033` 孙楠难度盘点适合强调“高压厚声型”：高位亮硬、持续声压、呼喊穿透、真假声转换、厚度和后段续航；不要只写最高音。
- 对男声高压难度盘点，Topic audio 适合先验证声音和切点，但如果用户重视画面运动，二版优先替换为官方 MV 或官方节目 live。
