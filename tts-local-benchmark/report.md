# 本地免费中文 TTS 方案对比验证报告

生成时间：2026-05-16 16:10:18 CST

本轮只验证本地免费、无需 API KEY、无需云账号和付费额度的中文 TTS 方案。测试目标是短视频剪辑、音乐盘点、解说口播场景里的中文旁白可用性。每个方案最多尝试两轮：官方推荐方式 + 一个可行替代方式；仍失败则记录原因并继续。

## 环境检测

- 检测时间: 2026-05-16 15:20:00 CST
- 工作目录: `/Users/yinshawnrao/explorer/wemedia/tts-local-benchmark`
- 操作系统: macOS 26.4.1 (arm64)
- Python: `Python 3.9.6`
- conda: `missing`
- uv: `missing`
- ffmpeg: `ffmpeg version 8.0.1`
- ffprobe: `ffprobe version 8.0.1`
- git: `git version 2.35.1`
- git-lfs: `missing`
- 推理硬件判断: `MPS`
- 硬件说明: Apple Silicon / MPS candidate
- 磁盘剩余空间: 531Gi free of 926Gi

环境结论：不建议直接升级 macOS 系统 Python。后续应使用 conda、uv、pyenv 或项目内 venv 固定 Python 3.10/3.11。缺少 `conda`、`uv`、`git-lfs` 是本轮重型方案失败的主要原因。`ffmpeg` 可用，demo 视频已生成。

## 总览结论

| 方案 | 是否跑通 | 是否需要 API KEY | 是否适合本地自动化 | 中文自然度 | 部署难度 | 速度 | 许可证/商业使用风险 | 推荐结论 |
|---|---|---|---|---|---|---|---|---|
| Kokoro 中文 | 是，生成 13 条 wav | 否 | 适合，脚本化最顺 | 3/5，需人工试听确认 | 低 | 快，约 0.8-1.7s/条 | Apache License，仍需核对模型/音色条款 | 本轮首选，先接入自动剪辑流程 |
| MeloTTS | 安装成功，推理失败 | 否 | 当前不适合 | 未评分 | 中 | 首条推理卡住 | MIT，风险较低 | 暂不推荐，换 Python 3.10/3.11 后可重测 |
| ChatTTS-ui | 安装成功，服务失败 | 否 | API 形态适合，但本机未跑通 | 未评分 | 中高 | 服务未启动 | CC BY-NC-ND 4.0，商用风险高 | 不适合作为当前生产候选 |
| CosyVoice / CosyVoice3 | 安装失败 | 否 | 当前不适合 | 未评分 | 高 | 未测试 | Apache-2.0，模型条款需另核 | 需要 conda + Python 3.10 后单独重测 |
| GPT-SoVITS | 依赖部分成功，推理失败 | 否 | 批量自动化较重 | 未评分 | 高 | 未测试 | MIT，但音色克隆需自有授权音频 | 适合固定栏目音色，不适合本轮快速接入 |
| IndexTTS2 | 克隆/LFS 失败，跳过推理 | 否 | 当前不适合 | 未评分 | 高 | 未测试 | bilibili Model Use License，商用需重点审查 | 高级候选，等 uv/git-lfs/Python 3.10+ 环境再测 |

## 推荐

1. 最推荐的 1-2 个方案：本轮只有 Kokoro 真正完成本地离线推理、双音色、语速参数和 demo 视频，因此首推 Kokoro。第二候选暂不列为可用，只建议后续优先重测 CosyVoice3 或 ChatTTS-ui。
2. 最适合接入 Codex 自动剪辑流程的方案：Kokoro。原因是安装轻、CLI/脚本可控、输出 wav 路径稳定、速度足够做批量旁白。
3. 最适合做固定栏目音色的方案：GPT-SoVITS 更符合“固定解说人设/音色克隆”的方向，但前提是准备用户自有或明确授权的参考音频，并使用官方 conda 环境。
4. 不推荐继续折腾的方案：当前环境下不建议继续在 MeloTTS、ChatTTS-ui、CosyVoice、GPT-SoVITS、IndexTTS2 上硬拧。主要缺口是 Python 版本、conda、uv、git-lfs 和模型下载链路，不是单个命令能稳定修好的问题。

## 逐项记录

### Kokoro 中文

- install_status: success
- run_status: success
- install_commands:
  - `python3.12 -m venv tts-local-benchmark/vendor/kokoro-test/venv`
  - `pip install "kokoro>=0.9.4" soundfile`
  - `pip install "misaki[zh]"`
- inference_commands:
  - `tts-local-benchmark/vendor/kokoro-test/venv/bin/python tts-local-benchmark/scripts/run_kokoro.py`
- generated_files:
  - `outputs/kokoro/kokoro_zf_xiaoyi_short_intro.wav`
  - `outputs/kokoro/kokoro_zm_yunxi_short_intro.wav`
  - `outputs/kokoro/kokoro_zf_xiaoyi_music_review.wav`
  - `outputs/kokoro/kokoro_zf_xiaoyi_mixed_text.wav`
  - `outputs/kokoro/kokoro_zf_xiaoyi_number_test.wav`
  - `outputs/kokoro/kokoro_zf_xiaoyi_emotional_test.wav`
  - `outputs/kokoro/kokoro_zf_xiaoyi_long_text.wav`
  - `outputs/kokoro/kokoro_zm_yunxi_music_review.wav`
  - `outputs/kokoro/kokoro_zm_yunxi_mixed_text.wav`
  - `outputs/kokoro/kokoro_zm_yunxi_number_test.wav`
  - `outputs/kokoro/kokoro_zm_yunxi_emotional_test.wav`
  - `outputs/kokoro/kokoro_zm_yunxi_long_text.wav`
  - `outputs/kokoro/kokoro_zf_xiaoyi_short_intro_speed115.wav`
- approx_latency: warmup 后约 0.8-1.7 秒/条
- hardware_used: CPU/MPS-capable macOS，Kokoro 本轮未单独锁定 GPU
- problems:
  - 首次脚本每条重复初始化 pipeline，运行过慢；已改为单次初始化后批量生成。
  - 未做人耳听感评分，中文自然度需要用户实际试听确认。
- subjective_score: 3/5（基于生成稳定性和已知模型定位，待人工试听确认）
- comments: 本轮唯一完整跑通方案，适合先做自动剪辑旁白基线。

### MeloTTS

- install_status: success
- run_status: failed
- install_commands:
  - `git clone https://github.com/myshell-ai/MeloTTS.git tts-local-benchmark/vendor/melotts/MeloTTS`
  - `python3 -m venv tts-local-benchmark/vendor/melotts/venv`
  - `pip install -e tts-local-benchmark/vendor/melotts/MeloTTS`
  - `python -m unidic download`
  - `pip install "typer[all]==0.9.0"`
- inference_commands:
  - `melo "text-to-speech 领域近年来发展迅速" zh.wav -l ZH -d cpu`
  - `python tts-local-benchmark/scripts/run_melotts_api.py --limit 2 --device cpu`
- generated_files: none
- approx_latency: CLI 首条约 3 分钟无输出后停止；Python API 加载模型后首条约 3.5 分钟卡住
- hardware_used: CPU
- problems:
  - 官方安装解析到 `typer 0.23.2`，触发 `pkg_resources.UnknownExtra`；固定 `typer[all]==0.9.0` 后 CLI 可启动。
  - CLI 与 Python API 都在首条中文推理阶段卡住，没有生成音频。
  - 系统 Python 3.9.6 虽接近旧文档要求，但依赖链已开始出现 EOL/兼容性压力。
- subjective_score: not scored
- comments: MIT、理论上轻量，但本轮推理不可用。

### ChatTTS-ui

- install_status: success
- run_status: failed
- install_commands:
  - `git clone https://github.com/jianchang512/ChatTTS-ui.git tts-local-benchmark/vendor/chattts-ui/ChatTTS-ui`
  - `python3 -m venv tts-local-benchmark/vendor/chattts-ui/venv`
  - `pip install -r requirements.txt`
  - `pip install torch==2.2.0 torchaudio==2.2.0`
  - `curl -L -o asset/spk_stat.pt https://huggingface.co/2Noise/ChatTTS/resolve/main/asset/spk_stat.pt`
  - 替代轮尝试 `torch==2.8.0` 与 `torch==2.4.1`
- inference_commands:
  - `python app.py`
  - `python tts-local-benchmark/scripts/run_chattts_api.py --base-url http://127.0.0.1:9966`
- generated_files: none
- approx_latency: 服务始终未到达可请求状态
- hardware_used: CPU
- problems:
  - 首次模型下载漏掉 `spk_stat.pt`，手动补齐。
  - README 推荐的 `torch==2.2.0` 与当前依赖 `vector-quantize-pytorch>=1.29.0` 冲突。
  - `torch==2.8.0` 出现 `torch.serialization.FILE_LIKE` 兼容错误。
  - `torch==2.4.1` 能继续加载但仍在服务端口打开前低 CPU 卡住。
- subjective_score: not scored
- comments: HTTP API 形态很适合自动剪辑，但当前源码部署不稳定；且 CC BY-NC-ND 4.0 对商业/改作限制明显。

### CosyVoice / CosyVoice3

- install_status: failed
- run_status: skipped
- install_commands:
  - `git clone --recursive https://github.com/FunAudioLLM/CosyVoice.git tts-local-benchmark/vendor/CosyVoice`
  - `git submodule update --init --recursive`
  - `python3 -m venv tts-local-benchmark/vendor/CosyVoice/venv`
  - `pip install -r requirements.txt`
  - 替代轮尝试 Python 3.12 venv
- inference_commands: none
- generated_files: none
- approx_latency: not measured
- hardware_used: not reached
- problems:
  - 官方推荐 conda + Python 3.10，本机没有 conda。
  - Python 3.9 无法满足 `gradio==5.4.0`。
  - Python 3.12 下 `grpcio==1.57.0` 需要源码构建并失败。
  - 因依赖安装未完成，未下载模型，也未运行示例。
- subjective_score: not scored
- comments: 当前官方文档推荐方向偏 Fun-CosyVoice3-0.5B，质量潜力高；但本机环境不适合快速跑通。

### GPT-SoVITS

- install_status: partial_success
- run_status: failed
- install_commands:
  - `git clone https://github.com/RVC-Boss/GPT-SoVITS.git tts-local-benchmark/vendor/GPT-SoVITS`
  - `bash install.sh --device CPU --source HF`
  - `python3 -m venv tts-local-benchmark/vendor/GPT-SoVITS/venv`
  - `pip install -r extra-req.txt --no-deps`
  - `pip install -r requirements.txt`
- inference_commands:
  - `python webui.py zh`
- generated_files: none
- approx_latency: WebUI 启动约 90 秒未到达可交互状态后停止
- hardware_used: CPU
- problems:
  - 官方 `install.sh` 要求 conda，缺 conda 后立即失败。
  - 手动 venv 依赖安装完成，但官方模型下载没有通过 install.sh 完成。
  - 本轮没有用户自有/授权参考音频，不做真人或歌手音色克隆。
  - WebUI 没有成功启动到可测试状态。
- subjective_score: not scored
- comments: 固定栏目音色方向值得保留，但部署和素材准备成本明显高于 Kokoro。

### IndexTTS2

- install_status: failed
- run_status: skipped
- install_commands:
  - `git clone https://github.com/index-tts/index-tts.git tts-local-benchmark/vendor/index-tts`
  - `git lfs pull`
  - `pip install -U uv`
  - `uv sync --all-extras`
- inference_commands:
  - `uv run tools/gpu_check.py`
  - `uv run webui.py`
  - `PYTHONPATH="$PYTHONPATH:." uv run indextts/infer_v2.py`
- generated_files: none
- approx_latency: not measured
- hardware_used: MPS available, not reached
- problems:
  - 本机缺少 `git-lfs`，克隆 checkout 阶段失败：`git-lfs filter-process: git-lfs: command not found`。
  - 官方文档要求 `git lfs install` 和 `git lfs pull`，没有 LFS 无法可靠取得完整工作区和模型相关文件。
  - 本机缺少全局 `uv`；由于 git-lfs 已阻断官方流程，本轮未继续下载大量依赖。
  - 官方 `pyproject.toml` 要求 Python >=3.10，系统 Python 3.9.6 不适合。
- subjective_score: not scored
- comments: 情感/时长控制是高级候选，但需要 Python 3.10+、uv、git-lfs 和模型完整下载后重测。

## 本地 TTS 服务封装草案

建议先用 Kokoro 封一个本地服务，保留统一接口，后续可把 engine 切到 CosyVoice 或 GPT-SoVITS。

```http
POST /tts
Content-Type: application/json
```

输入：

```json
{
  "text": "要合成的中文旁白",
  "voice": "zf_xiaoyi",
  "speed": 1.0
}
```

输出：

```json
{
  "wav_path": "/Users/yinshawnrao/explorer/wemedia/tts-local-benchmark/outputs/service/tts_20260516_001.wav",
  "duration": 8.42,
  "engine": "kokoro",
  "voice": "zf_xiaoyi"
}
```

实施建议：

1. 启动时只初始化一次 `KPipeline(lang_code="z")`。
2. API 层只做参数校验、文件命名、队列控制和结果返回。
3. 生成后的 wav 直接交给 `ffmpeg`，用于和视频轨、背景音乐、字幕时间轴合成。
4. voice 先固定 `zf_xiaoyi` 和 `zm_yunxi`，speed 支持 `0.9`、`1.0`、`1.15` 三档。
5. 后续若引入音色克隆，只允许使用用户自有或明确授权的参考音频。

## 试听优先级

最值得先听：

- `outputs/kokoro/kokoro_zf_xiaoyi_long_text.wav`
- `outputs/kokoro/kokoro_zm_yunxi_music_review.wav`
- `outputs/kokoro/kokoro_zf_xiaoyi_short_intro_speed115.wav`

对应 demo 视频在 `videos/` 下已生成。

## 参考来源

- Kokoro: https://github.com/hexgrad/kokoro
- MeloTTS: https://github.com/myshell-ai/MeloTTS
- ChatTTS-ui: https://github.com/jianchang512/ChatTTS-ui
- CosyVoice: https://github.com/FunAudioLLM/CosyVoice
- GPT-SoVITS: https://github.com/RVC-Boss/GPT-SoVITS
- IndexTTS2: https://github.com/index-tts/index-tts

<!-- AUDIO_INFO_APPENDIX -->

## 音频文件信息附录

| 文件 | 时长 | 采样率 | 大小 |
|---|---:|---:|---:|
| `outputs/kokoro/kokoro_zf_xiaoyi_emotional_test.wav` | 6.42s | 24000 Hz | 0.29 MB |
| `outputs/kokoro/kokoro_zf_xiaoyi_long_text.wav` | 13.65s | 24000 Hz | 0.62 MB |
| `outputs/kokoro/kokoro_zf_xiaoyi_mixed_text.wav` | 8.30s | 24000 Hz | 0.38 MB |
| `outputs/kokoro/kokoro_zf_xiaoyi_music_review.wav` | 9.03s | 24000 Hz | 0.41 MB |
| `outputs/kokoro/kokoro_zf_xiaoyi_number_test.wav` | 7.45s | 24000 Hz | 0.34 MB |
| `outputs/kokoro/kokoro_zf_xiaoyi_short_intro.wav` | 7.90s | 24000 Hz | 0.36 MB |
| `outputs/kokoro/kokoro_zf_xiaoyi_short_intro_speed115.wav` | 7.30s | 24000 Hz | 0.33 MB |
| `outputs/kokoro/kokoro_zm_yunxi_emotional_test.wav` | 6.15s | 24000 Hz | 0.28 MB |
| `outputs/kokoro/kokoro_zm_yunxi_long_text.wav` | 13.30s | 24000 Hz | 0.61 MB |
| `outputs/kokoro/kokoro_zm_yunxi_mixed_text.wav` | 8.07s | 24000 Hz | 0.37 MB |
| `outputs/kokoro/kokoro_zm_yunxi_music_review.wav` | 8.70s | 24000 Hz | 0.40 MB |
| `outputs/kokoro/kokoro_zm_yunxi_number_test.wav` | 7.33s | 24000 Hz | 0.34 MB |
| `outputs/kokoro/kokoro_zm_yunxi_short_intro.wav` | 7.55s | 24000 Hz | 0.35 MB |
