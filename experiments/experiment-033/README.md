# Experiment 033: 孙楠最难的5首歌

方向：用户提供孙楠 5 首高难度歌曲排名与描述。成片按 TOP 视频项目规则倒序揭晓，从 Top5 到 Top1。每段取歌曲里最能体现演唱难点的一段，保留原声，叠加排名、歌名、歌手和观众向演唱难点说明。

## User Ranking

| User Rank | Song | User Description |
|---|---|---|
| 1 | 拯救 | 副歌高音又亮又硬，后段还要持续顶住声压，普通人很容易从“拯救”唱成“求救”。 |
| 2 | 燃烧 | 音域跨度大，真假音转换和瞬间飙高音都很狠，唱到后面真有一种嗓子在燃烧的感觉。 |
| 3 | 你快回来 | 副歌持续高位输出，气息和穿透力要求极高，声音一虚就撑不起那种呼喊感。 |
| 4 | 风往北吹 | 主歌要稳，副歌要开，情绪还要一路往上推，难在高音不只是到位，还得有力量和厚度。 |
| 5 | 不见不散 | 看似旋律顺，其实副歌音区很顶，咬字、气息和高音稳定性都要在线，KTV里很容易越唱越紧。 |

## Edit Order

| Video Rank | Song | Source Type | Planned Clip | Cut Reason |
|---|---|---|---|---|
| Top 5 | 不见不散 | Music video / label upload | 00:02:42-00:03:16 | 后段副歌音区高，咬字和气息稳定性集中 |
| Top 4 | 风往北吹 | Lyric video / preview source | 00:03:16-00:03:50 | 副歌打开后情绪继续上推，高音需要厚度 |
| Top 3 | 你快回来 | Music video / label upload | 00:02:45-00:03:19 | 呼喊感副歌持续高位，穿透力要求高 |
| Top 2 | 燃烧 | Sun Nan Topic audio | 00:03:18-00:03:52 | 后段真假声边缘和瞬间高点更集中 |
| Top 1 | 拯救 | Sun Nan Topic audio | 00:04:10-00:04:44 | 后段副歌持续顶声压，亮硬高音集中 |

## Editorial Rules

- Visible title: `孙楠最难的歌` + line break + `TOP5`.
- Reveal order: `Top5 -> Top4 -> Top3 -> Top2 -> Top1`.
- Visible copy focuses on vocal difficulty: high-position power, breath support, pressure, register switching, diction, and emotional push.
- Visible copy must not mention internal workflow, prompt text, source collection process, sandbox, or project constraints.
- Rights status is `rights_review`; this is a local experiment preview, not a publishing package.

## Output

Preview video:

```text
sandbox/exports/experiment-033/sun-nan-top5-vocal-difficulty-preview.mp4
```

Contact sheet:

```text
sandbox/exports/experiment-033/sun-nan-top5-vocal-difficulty-contact-sheet.jpg
```

## QA Result

- Structure: passed. The edit reveals `Top5 -> Top4 -> Top3 -> Top2 -> Top1`.
- Visual: passed. Contact sheet shows the intro, five rank cards, and closing card clearly.
- Export: passed. Output is 1080x1920, H.264 video, AAC stereo audio, about 180.5 seconds.
- Audio: passed for local preview. `volumedetect` reported mean volume around -19.0 dB and max volume around -3.7 dB.
- Copy safety: passed. Visible text scan found no internal workflow, prompt, project, sandbox, or Codex wording.
- Rights: `rights_review`. This remains a local experiment preview.

## Notes

- `燃烧` and `拯救` use Topic audio sources, so their visuals are static artwork-style frames wrapped in the vertical layout.
- `风往北吹` uses a lyric video preview source because an original official MV/Topic original-song source was not easy to locate on YouTube; the source remains marked `rights_review`.
