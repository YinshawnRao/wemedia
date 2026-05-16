# Source Candidates: Space Flame

Date checked: 2026-05-10

Topic: 太空里的火焰为什么是圆的？

## Candidate Sources

### src-001

- Title: Flame in Reduced Gravity
- URL: https://www.youtube.com/watch?v=d0FAgKZU880
- Publisher: NASA Video
- Type: YouTube video
- Intended use: 主视觉 hook。展示 reduced-gravity candle flame。
- Candidate range: 待下载前用 `list-formats.sh` 和预览确认，预计取 5-12 秒短片段。
- Rights status: `rights_review`
- Risk note: NASA 官方视频通常较适合教育/解释使用，但发布前仍需保留来源和确认使用条款。

### src-002

- Title: Candle Flame - 1g vs Microgravity
- URL: https://www.nasa.gov/image-article/candle-flame-1g-vs-microgravity/
- Publisher: NASA
- Type: NASA image article
- Intended use: 对比图、解释支撑、封面候选。
- Candidate range: static image, no time range.
- Rights status: `rights_review`
- Risk note: 记录 NASA credit。适合作为解释段视觉支撑。

### src-003

- Title: Advanced Combustion via Microgravity Experiments (ACME)
- URL: https://science.nasa.gov/image-detail/candle-flames-3/
- Publisher: NASA Science
- Type: NASA image detail
- Intended use: 火焰形态解释、素材备选。
- Candidate range: static image, no time range.
- Rights status: `rights_review`
- Risk note: 记录 NASA credit。

### src-004

- Title: Why NASA is studying flames in space
- URL: https://science.nasa.gov/biological-physical/resources/explainers-infographics/why-nasa-is-studying-flames-in-space/
- Publisher: NASA Science
- Type: NASA explainer
- Intended use: 文案事实依据。
- Candidate range: text reference, no media range.
- Rights status: `reference_only`
- Risk note: 用于事实核对，不直接搬运长文本。

## Proposed Hook

你以为火焰天生就是尖的？到太空里，它会变成一个蓝色小球。

## Proposed 35-Second Structure

```text
0-3s    反直觉 hook：地球火焰 vs 微重力火焰
3-10s   展示 NASA reduced-gravity 火焰素材
10-22s  解释：地球上热空气上升，拉出尖形；微重力中对流弱，氧气靠扩散靠近火焰
22-30s  为什么 NASA 要研究这个：太空舱火灾安全、燃烧效率
30-35s  收束：火焰不是“天生尖”，是重力把它塑形
```

## Download Test Plan

First test command:

```bash
WEMEDIA_OUTPUT_MODE=test ./scripts/yt-dlp/download-clip.sh "https://www.youtube.com/watch?v=d0FAgKZU880" "experiment-001" "00:00:00" "00:00:12"
```

If YouTube blocks with bot verification, try only metadata/format inspection first:

```bash
WEMEDIA_OUTPUT_MODE=test ./scripts/yt-dlp/list-formats.sh "https://www.youtube.com/watch?v=d0FAgKZU880"
```

## First Smoke Test Result

The format inspection command was attempted on 2026-05-10.

Initial result: YouTube returned bot verification because Chrome cookies could not be decrypted after Chrome permission was accidentally rejected.

Retry result: succeeded after Chrome permission was allowed.

```bash
WEMEDIA_OUTPUT_MODE=test ./scripts/yt-dlp/list-formats.sh "https://www.youtube.com/watch?v=d0FAgKZU880"
```

The first test clip has been downloaded. See `downloaded_assets.md`.
