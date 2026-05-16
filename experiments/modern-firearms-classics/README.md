# Modern Firearms Classics

Status: local test build in progress

Slug: `modern-firearms-classics`

Goal: 制作一支竖屏 TOP5 科普盘点视频，主题为“现代战争最经典的枪械武器 TOP5”。每段需要有对应枪械出镜镜头，画面叠加中文军事知识科普文字，并全程在右上角显示小字提示：

```text
纯科普视频｜不构成购买、改装或使用建议
```

Default assumptions:

- Audience: 泛军事兴趣观众，不做操作教学。
- Platform: 竖屏短视频，本地测试预览优先。
- Aspect ratio: 1080x1920.
- Duration: 约 75-90 秒。
- Tone: 新闻纪录片式，克制、信息密度高。
- Voiceover: 暂不做旁白，先用屏幕文字完成科普节奏。
- Source boundary: 本地测试使用，优先 DVIDS 官方公开素材；保留来源、日期、片段和授权备注。
- Directory naming: 不使用 `experiment-001` 这类数字序号目录；本轮统一使用主题 slug。

Key paths:

- Sources: `data/sources/modern-firearms-classics_sources.md`
- Experiment notes: `experiments/modern-firearms-classics/`
- Brief: `data/briefs/modern-firearms-classics.md`
- HyperFrames project: `hyperframes/projects/modern-firearms-classics/`
- Test export: `sandbox/exports/modern-firearms-classics/`
