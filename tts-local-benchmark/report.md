# 本地免费中文 TTS 方案对比验证报告

生成时间：待更新

## 环境检测

待运行 `scripts/check_env.sh` 后填充。

## 总览结论

待测试完成后填写。

| 方案 | 是否跑通 | 是否需要 API KEY | 是否适合本地自动化 | 中文自然度 | 部署难度 | 速度 | 许可证/商业使用风险 | 推荐结论 |
|---|---|---|---|---|---|---|---|---|
| Kokoro 中文 | 待测试 | 否 | 待评估 | 待评估 | 待评估 | 待评估 | 待核对 | 待评估 |
| MeloTTS | 待测试 | 否 | 待评估 | 待评估 | 待评估 | 待评估 | 待核对 | 待评估 |
| ChatTTS-ui | 待测试 | 否 | 待评估 | 待评估 | 待评估 | 待评估 | 待核对 | 待评估 |
| CosyVoice | 待测试 | 否 | 待评估 | 待评估 | 待评估 | 待评估 | 待核对 | 待评估 |
| GPT-SoVITS | 待测试 | 否 | 待评估 | 待评估 | 待评估 | 待评估 | 待核对 | 待评估 |
| IndexTTS2 | 待测试 | 否 | 待评估 | 待评估 | 待评估 | 待评估 | 待核对 | 待评估 |

## 逐项记录

### Kokoro 中文

- install_status: pending
- run_status: pending
- install_commands: pending
- inference_commands: pending
- generated_files: pending
- approx_latency: pending
- hardware_used: pending
- problems: pending
- subjective_score: pending
- comments: pending

### MeloTTS

- install_status: pending
- run_status: pending
- install_commands: pending
- inference_commands: pending
- generated_files: pending
- approx_latency: pending
- hardware_used: pending
- problems: pending
- subjective_score: pending
- comments: pending

### ChatTTS-ui

- install_status: pending
- run_status: pending
- install_commands: pending
- inference_commands: pending
- generated_files: pending
- approx_latency: pending
- hardware_used: pending
- problems: pending
- subjective_score: pending
- comments: pending

### CosyVoice

- install_status: pending
- run_status: pending
- install_commands: pending
- inference_commands: pending
- generated_files: pending
- approx_latency: pending
- hardware_used: pending
- problems: pending
- subjective_score: pending
- comments: pending

### GPT-SoVITS

- install_status: pending
- run_status: pending
- install_commands: pending
- inference_commands: pending
- generated_files: pending
- approx_latency: pending
- hardware_used: pending
- problems: pending
- subjective_score: pending
- comments: pending

### IndexTTS2

- install_status: pending
- run_status: pending
- install_commands: pending
- inference_commands: pending
- generated_files: pending
- approx_latency: pending
- hardware_used: pending
- problems: pending
- subjective_score: pending
- comments: pending

## 推荐与接入

1. 最推荐的 1-2 个方案：待测试完成后填写。
2. 最适合接入 Codex 自动剪辑流程的方案：待测试完成后填写。
3. 最适合做固定栏目音色的方案：待测试完成后填写。
4. 不推荐继续折腾的方案及原因：待测试完成后填写。

## 本地 TTS 服务封装草案

```http
POST /tts
Content-Type: application/json

{
  "text": "要合成的中文旁白",
  "voice": "默认或栏目固定音色",
  "speed": 1.0
}
```

返回：

```json
{
  "wav_path": "/absolute/path/to/output.wav",
  "duration": 8.42,
  "engine": "selected-local-engine"
}
```
