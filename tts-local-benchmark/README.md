# 本地免费中文 TTS 方案对比验证

这个目录用于验证后续自动化视频剪辑中可插入的本地中文配音方案。测试范围只包含免费、本地运行、无需 API KEY 或云服务账号的方案。

## 测试顺序

1. Kokoro 中文
2. MeloTTS
3. ChatTTS-ui
4. CosyVoice / CosyVoice2 / CosyVoice3
5. GPT-SoVITS
6. IndexTTS2

## 目录

- `samples/test_texts.json`: 本轮中文测试文案。
- `scripts/check_env.sh`: 本机环境检测。
- `scripts/run_kokoro.py`: Kokoro 官方 pip 方式中文测试。
- `scripts/run_melotts.sh`: MeloTTS CLI 批量测试入口。
- `scripts/run_chattts_api.py`: ChatTTS-ui 本地 HTTP API 测试入口。
- `scripts/compare_audio_info.py`: 扫描音频并生成时长、采样率、大小表。
- `scripts/make_demo_video.sh`: 用 ffmpeg 给成功生成的音频制作简单试听视频。
- `outputs/`: 各方案生成音频。
- `videos/`: 各方案 demo 视频。
- `vendor/`: 各方案源码、虚拟环境或模型缓存。

## 注意

重型方案可能需要较大的模型下载、较长安装时间或指定硬件。每个方案最多尝试两轮：官方推荐方式和一个可行替代方式；仍失败则记录原因并继续下一个方案。
