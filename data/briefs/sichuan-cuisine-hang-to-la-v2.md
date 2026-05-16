# Editing Brief: 川菜从夯到拉

Slug: `sichuan-cuisine-hang-to-la-v2`

Experiment: `experiment-034`

Working title: `川菜从夯到拉`

## Format

- Aspect ratio: 1080x1920 vertical.
- Duration target: 56 seconds.
- Platform assumption: 抖音 / B站竖屏本地测试。
- Audience assumption: 中文互联网泛娱乐观众，能接受主观锐评和评论区争议。
- Tone: 轻度吐槽，不人身攻击，不把真实地方饮食说死。
- Voiceover: current project default local TTS, `zm_yunxi`, SRT timeline-aligned.
- Subtitles: large yellow bottom subtitles, matching the accepted “从夯到拉” style.
- Source footage: none. This pass uses original copy, procedural table graphics, and local TTS only.

## Rights Boundary

- No external video, image, music, or platform template is used.
- The ranking is original entertainment commentary and should be understood as subjective.
- If a later version uses real dish footage, every clip must be logged in `data/sources/` and reviewed before download.

## Ranking Logic

这版不是“川菜地位榜”，而是“短视频第一口冲击力榜”：看的是香气、识别度、下饭感、梗图传播性，以及是否适合评论区开排。

| Tier | Items | Rationale |
|---|---|---|
| 夯 | 麻婆豆腐、水煮牛肉 | 香、麻、烫、下饭度强，观众一眼能懂。 |
| 顶级 | 回锅肉、辣子鸡、鱼香肉丝 | 经典稳定、味型鲜明，适合争议但不弱。 |
| 人上人 | 夫妻肺片、口水鸡 | 红油冷菜审美更吃懂行体验。 |
| NPC | 宫保鸡丁 | 太稳定也太常见，短视频冲击力偏默认档。 |
| 拉完了 | 景区红油套餐 | 不批评真川菜，只批评“只剩红油和咸味”的坏体验。 |

## Beat Sheet

1. Hook, 0-5s
   - Text: `川菜从夯到拉`
   - Subtitle: `主观娱乐榜，只聊第一口冲击力`

2. Object reveals, 4.5-47.5s
   - 每个盘点对象单独出场、单独入档、单独给一句判词。
   - 麻婆豆腐 -> 夯：`川菜门面，一勺下去米饭先投降。`
   - 水煮牛肉 -> 夯：`看着凶，其实香麻烫才是核心伤害。`
   - 回锅肉 -> 顶级：`锅气一出来，减肥计划当场请假。`
   - 辣子鸡 -> 顶级：`找鸡像寻宝，越翻越上头。`
   - 鱼香肉丝 -> 顶级：`没鱼但有魂，酸甜咸辣卡得很准。`
   - 夫妻肺片 -> 人上人：`红油冷菜天花板，懂的人先夹一筷。`
   - 口水鸡 -> 人上人：`名字像玩笑，红油是正经功夫。`
   - 宫保鸡丁 -> NPC：`稳是稳，就是太像菜单默认头像。`
   - 景区红油套餐 -> 拉完了：`只红不香，只咸不麻，直接拉完。`

3. Closing, 47.5-56s
   - Text: `真正的川菜，一城一味，一桌一江湖。`
   - CTA: `你心里的夯菜是哪一道？`

## Visual Notes

- Follow root `DESIGN.md`: deep charcoal background, warm paper surface, red-orange signal, warm yellow captions, teal progress accents.
- Preserve screenshot memory: black stage, left tier labels, grey table, yellow bottom subtitle.
- Avoid blue/purple SaaS gradients and generic rounded grey card stacks.
