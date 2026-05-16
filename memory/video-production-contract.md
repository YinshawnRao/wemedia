# Video Production Contract

Last updated: 2026-05-16

Purpose: make new Codex conversations behave like the long-running music-video production thread. This file captures the operational defaults that should not drift between sessions.

## 1. Session Bootstrap

Before any video-making task, read:

```text
AGENTS.md
memory/video-production-contract.md
memory/project-state.md
memory/learnings.md
DESIGN.md
```

If continuing an existing experiment, also read:

```text
experiments/<experiment-id>/run_log.md
experiments/<experiment-id>/demo_output.md
experiments/<experiment-id>/source_candidates.md
data/briefs/<video-slug>.md
```

The current project path is:

```text
/Users/yinshawnrao/explorer/wemedia
```

## 2. Default User Intent

Unless the user explicitly says otherwise, interpret video requests as:

- personal local testing
- short-video demo generation
- not commercial publishing
- not a rights-cleared delivery package
- not formal asset-library ingestion

Practical consequence:

- Do not block normal local experiments just because a music source is `rights_review`.
- Still keep source traceability and never describe unclear material as commercially usable.
- Never bypass DRM, paid access, member-only pages, private videos, login walls, or platform access controls.

## 3. Directory Rules

Default for every new music/video experiment:

```text
experiments/experiment-XXX/
data/sources/experiment-XXX_sources.md
data/briefs/<video-slug>.md
hyperframes/projects/<video-slug>/
sandbox/yt-dlp/clips/experiment-XXX/
sandbox/hyperframes/experiment-XXX/
sandbox/exports/experiment-XXX/
```

Do not write test media to these formal directories unless the user explicitly asks for formal ingestion:

```text
downloads/
clips/
audio/
subtitles/
assets/exports/
```

New experiment IDs must continue the numeric sequence, e.g. after `experiment-032`, use `experiment-033`.

## 4. Music Roundup Defaults

Default format:

- vertical short video
- 1080x1920
- source audio only
- no narration unless the user explicitly asks for 配音 / 旁白 / 解说 / 口播
- no paid TTS
- concise lower-third text
- contact sheet for visual QA
- preview video in `sandbox/exports/<experiment-id>/`
- keep only final deliverables in `sandbox/exports/<experiment-id>/`; intermediate base renders should stay in a work directory or be removed after the final MP4 is created

When narration is requested, use the project default voice. This applies even when the user does not say “male voice”; any 配音 / 旁白 / 解说 / 口播 request maps to this voice:

```text
config/tts/default-voiceover.json
scripts/tts/render-default-voiceover.sh
scripts/tts/voiceover-video.sh
voice: zm_yunxi
source standard: tts-local-benchmark Kokoro male output approved by user
```

Do not ask for a voice choice during normal video goals. Do not use the deprecated ONNX Kokoro runtime, `.venv-kokoro-runtime`, `models/kokoro/`, `am_michael`, `zf_xiaobei`, or old voice-map files.

For Chinese `zm_yunxi` voiceover, do not pass raw mixed English/digit title markers such as `TOP5`, `TOP10`, `Top 5`, or `Top10` directly to TTS. Normalize spoken text to stable Chinese wording such as `前五名` / `前十名` while keeping the visual title as `TOP5` / `TOP10`. Before final delivery, inspect the TTS manifest and, when the title contains abbreviations or digits, treat the voiceover as needing an explicit pronunciation check.

For `TOP5` difficulty/甜歌/翻唱/作品盘点 videos:

- reveal order is `Top5 -> Top1`
- user-provided 1-5 ranking is input ranking, not edit order
- do not put “倒序” or other logic notes in the title
- title should be short; only `TOP5` / `TOP10` should usually get its own large line
- each song segment is usually 30-34 seconds for a first demo
- if user asks for “完整副歌” or longer pacing, extend segment length

## 5. Visible Copy Rules

Visible video text may include:

- title
- subtitle
- ranking
- song title
- singer/performer
- original singer
- lyricist/composer
- short difficulty, style, memory-point, or emotion copy
- closing question

Visible video text must not include:

```text
Codex
prompt
提示词
项目约束
任务说明
素材搜集
sandbox
workflow
内部
实验目录
WEMEDIA
download plan
rights_review
```

Internal notes belong in `experiments/`, `data/`, and `memory/`, never in the rendered video.

## 6. Source Selection Rules

Priority order for music clips:

1. Official MV
2. Official live
3. Official audio or artist Topic
4. Trusted authorized source
5. Non-official source only as `rights_review` backup when needed

For difficulty videos, sound quality and the target musical moment matter more than rich visuals. Official audio is acceptable for a first local demo if the MV is not available or is less reliable. Record that choice in `source_candidates.md`.

For live, cover, or “名场面” videos, visual motion matters. If a selected source is static artwork, replace it with a better moving source before finalizing the demo, or clearly log the tradeoff.

## 7. yt-dlp Defaults

Default command behavior:

```text
--cookies-from-browser chrome
--js-runtimes node
--merge-output-format mp4
--force-keyframes-at-cuts
```

Fast preview format:

```text
YTDLP_FORMAT='bv*[height<=1080]+ba/b[height<=1080]/b'
```

For music roundup first demos, skip subtitle download unless the task actually needs subtitles:

```text
--no-write-subs
--no-write-auto-subs
```

Troubleshooting:

- Bot verification: confirm Chrome login and cookie permission first.
- Semaphore error: avoid parallel `yt-dlp`; run searches/downloads sequentially.
- DNS failure: retry the same URL and cut once before replacing the source.
- Split-stream EOF: retry with muxed/lower format before replacing the source.
- Subtitle HTTP 429: disable subtitle download and keep the same media source if the clip itself downloads.

## 8. Rendering Defaults

Preferred first-demo path for music TOP videos:

```text
scripts/video/pillow_top5_renderer.py
experiments/<experiment-id>/render_top5_preview_pillow.py
```

Use HyperFrames for polish or more complex motion, but Pillow + ffmpeg is the stable fallback for quick local previews.

Always read `DESIGN.md` before visual work. Current look:

- deep charcoal background
- warm paper surface
- red-orange, teal, warm yellow accents
- clean editorial lower thirds
- no default blue/purple gradient style

## 9. QA Checklist

Before final response:

- preview MP4 exists
- contact sheet exists
- no extra intermediate MP4 remains beside the final preview unless the user explicitly asks to keep it
- `ffprobe` confirms 1080x1920, H.264, AAC stereo
- audio is present and not silent
- contact sheet visually shows intro, all segments, and closing
- visible copy does not contain internal wording
- output order follows TOP countdown when applicable
- current experiment docs are updated
- `memory/project-state.md` is updated
- useful new learning goes into `memory/learnings.md`

## 10. Final Response Pattern

Final response should be concise and include:

- video preview embedded with absolute path
- contact sheet embedded with absolute path
- one-line QA summary
- note if any source is visually static, replaced, or has a known caveat
- links to `run_log.md` and `source_candidates.md`

Do not over-explain shell commands unless the user asks.

## 11. Content-Specific Copy Memory

Difficulty videos:

- Angela Zhang: strong mix, high-position brightness, penetration, stamina, narrative stability.
- A-Mei: sustained pressure, belting, grit, breath stamina, low-to-high stability, dramatic tension.
- Fish Leong: gentle control, clarity, breath line, pitch detail, mixed/head voice edge, emotional layering.
- Faye Wong: light control, air voice, virtual/real timbre, experimental rhythm, restraint.
- Eason Chan: control difficulty, long breath, dynamic range, diction, theatrical expression.
- Jay Chou: high-position diction, restrained crying tone, falsetto edge, stamina.
- Elva Hsiao: dance-pop rhythm, breath cuts, groove, fast diction, attack.
- Wang Leehom: strong mix, register bridge, dense high notes, long sustained tones.
- David Tao: R&B groove, articulation, turns, rhythmic pressure.
- JJ Lin: high-position stability, long-line endurance, mixed voice, fast register switching.

Creator/works videos:

- credit-first: song, original singer, lyricist, composer
- write creative identity and memory point, not vocal difficulty

Sweet-song videos:

- emotion-first: 元气、清新、俏皮、甜蜜、温柔、恋爱感
- avoid technical vocal terms unless user asks
