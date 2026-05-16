# Experiment 015: 杨丞琳最甜的5首歌

方向：用户提供杨丞琳甜歌歌单和描述文字。成片作为甜歌主题盘点，不硬写 TOP 排名；按用户给定顺序呈现，每段取歌曲高潮或最高音附近段落，保留原曲声音，画面文案只保留歌名与甜歌氛围标签。

## User Song List

| Order | Song | User Description |
|---|---|---|
| 1 | 庆祝 | 元气欢快甜歌，节奏轻快，少女感十足。 |
| 2 | 甜心咒 | 俏皮有律动，甜度拉满，和庆祝风格高度一致。 |
| 3 | 可爱 | 曲风软萌清新，唱腔清甜，同属甜妹元气路线。 |
| 4 | 遇上爱 | 旋律轻快甜蜜，青涩恋爱氛围感，风格统一。 |
| 5 | 只想爱你 | 温柔清甜抒情，嗓音软糯，和整组曲风适配融洽。 |

## Edit Order

| Order | Song | Source Type | Clip | Cut Reason |
|---|---|---|---|---|
| 01 | 庆祝 | Official MV | 00:03:13-00:03:49 | 终段副歌，元气甜度最集中 |
| 02 | 甜心咒 | Official video karaoke | 00:02:50-00:03:35 | 终段 hook + 副歌，律动和俏皮感集中 |
| 03 | 可爱 | Official MV | 00:02:57-00:03:38 | 终段副歌，软萌清甜唱腔最明显 |
| 04 | 遇上爱 | Official MV | 00:02:55-00:03:44 | 终段副歌，青涩恋爱氛围完整 |
| 05 | 只想爱你 | Official MV | 00:03:17-00:04:12 | 终段连续副歌，温柔甜感和情绪推进完整 |

## Editorial Rules

- Visible title: `杨丞琳最甜的5首歌`
- Visible copy must not mention prompts, project rules, internal constraints, sandbox, or experiment wording.
- This is a theme list, not a hard vocal-difficulty ranking; visible labels use `01-05` and mood tags rather than `Top`.
- Rights status is `rights_review`; this is a local sandbox preview, not a publishing package.

## Output

Generated:

```text
sandbox/exports/experiment-015/rainie-sweet-songs-preview.mp4
sandbox/exports/experiment-015/rainie-sweet-songs-contact-sheet.jpg
```

## QA

- Video: 1080x1920, H.264, 30fps
- Audio: AAC stereo, 48kHz
- Duration: 236.52s
- Volume check: mean -18.4 dB, max -1.0 dB
- Visual check: contact sheet reviewed; visible copy contains only audience-facing title, song names, mood labels, and short notes.

## Notes

- `甜心咒` first download hit an audio stream EOF; retrying with a lower/muxed HLS format completed successfully.
- The source is marked `rights_review`; this is a local preview package.
