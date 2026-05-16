# Brief: 蔡依林最难的歌 TOP5

Experiment: experiment-035
Format: vertical short video, 1080x1920
Audio: source audio, with title voiceover only during intro
Narration: intro title only, project default voice `zm_yunxi`
Subtitle style: concise lower-third text
Tone: 节奏感强、音乐科普感、有轻微吐槽但不攻击歌手

## Reveal Order

1. Top 5: 特务J
2. Top 4: 倒带
3. Top 3: 怪美的
4. Top 2: Play 我呸
5. Top 1: 舞娘

## Visible Copy

Intro:

```text
蔡依林最难的歌
TOP5
唱跳、咬字、气息和态度，全都要同时在线。
```

Clips:

| Rank | Song | Header | Difficulty Copy | Detail |
|---|---|---|---|---|
| Top 5 | 特务J | TOP 5 / 越跳越难唱 | 难点：唱跳绑定 / 咬字攻击 / 气息控制 | 副歌要有攻击性，节奏一乱气势就散。 |
| Top 4 | 倒带 | TOP 4 / KTV陷阱歌 | 难点：高位副歌 / 情绪重量 / 真假声衔接 | 唱轻了没痛感，唱重了又容易喊。 |
| Top 3 | 怪美的 | TOP 3 / 怪得很费劲 | 难点：节奏切分 / 力量推进 / 态度稳定 | 旋律不太顺口，唱歪了就真的很累。 |
| Top 2 | Play 我呸 | TOP 2 / 嘴和肺上班 | 难点：密集咬字 / 碎拍节奏 / 舞曲律动 | Rap感和态度都要卡准，慢半拍就掉味。 |
| Top 1 | 舞娘 | TOP 1 / 唱跳天花板 | 难点：节奏气息 / 肢体控制 / 异域律动 | 边跳边唱还要稳，普通人光扭都喘。 |

Closing:

```text
哪首最难稳住？
蔡依林的难，不只在高音，更在边动边准。
下一期继续拆华语唱跳名场面。
```

## Visual Direction

Follow `DESIGN.md`: deep charcoal background, warm paper and red-orange/teal/yellow accents, clean editorial lower thirds, no blue-purple gradients, no internal workflow copy.

## Output And QA

Preview:

```text
sandbox/exports/experiment-035/jolin-top5-vocal-difficulty-preview.mp4
```

Contact sheet:

```text
sandbox/exports/experiment-035/jolin-top5-vocal-difficulty-contact-sheet.jpg
```

QA:

- Structure check passed: intro, Top5 through Top1, closing.
- Visual check passed: contact sheet covers intro, five segments, and closing.
- Export check passed: 1080x1920 MP4 with AAC stereo audio, about 180.53 seconds.
- Voiceover fix passed: TTS text was normalized from raw `TOP5` to the stable spoken form `前五名`, while the visual title remains `TOP5`.
- Copy scan passed: no rendered internal workflow or prompt-related wording.
- Caveat: `倒带` uses an official-channel audio source with static/low-motion visuals for the first local preview.
