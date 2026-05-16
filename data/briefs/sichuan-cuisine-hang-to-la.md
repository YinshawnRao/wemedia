# Editing Brief: 川菜从夯到拉

Slug: `sichuan-cuisine-hang-to-la`

Working title: `川菜从夯到拉`

## Format

- Aspect ratio: 1080x1920 vertical.
- Duration target: 45 seconds.
- Platform assumption: 抖音 / B站竖屏试跑。
- Audience assumption: 中文互联网泛娱乐观众，能接受主观锐评和评论区争议。
- Tone: 梗图式、主观、快节奏，但不把川菜真实复杂性说死。
- Voiceover: Kokoro local TTS, `cmn`, voice `zf_xiaoxiao`, SRT timeline-aligned.
- Subtitles: 大号黄色底部字幕，贴近用户参考截图。
- Source footage: none. This first run uses original text, vector-like drawing, procedural table motion, and generated voice only.

## Rights Boundary

- No external video, image, music, or B站模板 is used in this run.
- The ranking is original entertainment copy and should be labeled as subjective.
- If a later version uses real dish footage, every clip must be logged in `data/sources/` and reviewed for rights.

## Ranking Logic

这版不是“川菜地位榜”，而是“短视频第一口冲击力榜”。

| Tier | Items | Rationale |
|---|---|---|
| 夯 | 麻婆豆腐、水煮牛肉 | 香、麻、烫、下饭度都强，外地观众一眼能懂。 |
| 顶级 | 回锅肉、辣子鸡、鱼香肉丝 | 经典、稳定、强下饭，适合评论区争议。 |
| 人上人 | 夫妻肺片、口水鸡 | 红油审美和冷菜香气更吃懂行体验。 |
| NPC | 宫保鸡丁 | 太稳、太常见，常被做成菜单默认款。 |
| 拉完了 | 景区伪川菜 | 不批评真川菜，只批评“只咸不香、只有红油滤镜”的伪版本。 |

## Beat Sheet

1. Hook, 0-5s
   - Text: `川菜从夯到拉`
   - Subtitle: `主观娱乐榜，只聊第一口冲击力`

2. Object reveals, 4.5-37.5s
   - 每个盘点对象单独出场、单独入档、单独给一句判词。
   - 麻婆豆腐 → 夯：`川菜门面，一勺下去先把米饭叫醒。`
   - 水煮牛肉 → 夯：`看着猛，香麻烫才是核心杀伤。`
   - 回锅肉 → 顶级：`锅气一出来，顶级下饭机器。`
   - 辣子鸡 → 顶级：`找鸡像考古，越翻越上头。`
   - 鱼香肉丝 → 顶级：`没鱼但有魂，糖醋咸辣得卡得准。`
   - 夫妻肺片 → 人上人：`红油冷菜天花板，懂的人先夹一筷。`
   - 口水鸡 → 人上人：`名字像玩笑，红油是正经功夫。`
   - 宫保鸡丁 → NPC：`稳定，但像菜单默认头像。`
   - 景区伪川菜 → 拉完了：`只咸不香只剩辣，直接拉完。`

3. Closing, 37.5-46s
   - Text: `真正的川菜：一城一味，一桌一江湖。`
   - CTA: `评论区开排`

## Visual Notes

- Follow root `DESIGN.md`: deep charcoal background, warm paper surface, red-orange signal, warm yellow captions, teal source/progress accents.
- Preserve screenshot memory: black stage, left tier labels, grey table, yellow bottom subtitle.
- Avoid blue/purple SaaS gradients and generic rounded grey card stacks.
