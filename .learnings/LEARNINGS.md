# Learnings

## [LRN-20260510-001] correction

**Logged**: 2026-05-10T14:30:00+08:00
**Priority**: high
**Status**: pending
**Area**: workflow

### Summary
Music roundup clips need enough time for the chorus or hook to land.

### Details
The 5-singer music demo looked promising, but 6-second excerpts were too short. The user specifically noted that some clips cut away before the chorus arrived. The 10-singer version moved to roughly 27 seconds per singer.

### Suggested Action
Default music roundup segment length to 25-30 seconds. If the target video must stay under 90 seconds, reduce the number of singers instead of shortening every excerpt to a few seconds.

### Metadata
- Source: user_feedback
- Related Files: `experiments/experiment-003/README.md`
- Tags: music, editing, pacing

---

## [LRN-20260510-002] best_practice

**Logged**: 2026-05-10T14:30:00+08:00
**Priority**: medium
**Status**: pending
**Area**: video

### Summary
Use ffmpeg fast previews before full HyperFrames renders for long music roundups.

### Details
HyperFrames passed lint and inspect for the 4 minute 40 second long chorus video, but full frame capture became too slow after worker calibration dropped to one worker. A fast preview path using Chrome-rendered PNG overlays plus ffmpeg concat produced a usable local demo much faster.

### Suggested Action
For long music experiments, first generate a fast preview with `experiments/experiment-003/render_ffmpeg_preview.sh`. Use HyperFrames full rendering only after the pacing is approved or for shorter, highly animated edits.

### Metadata
- Source: error
- Related Files: `experiments/experiment-003/render_ffmpeg_preview.sh`
- Tags: hyperframes, ffmpeg, longform-preview

---

## [LRN-20260510-003] best_practice

**Logged**: 2026-05-10T23:45:00+08:00
**Priority**: medium
**Status**: pending
**Area**: video

### Summary
Single-singer music specials work better as chaptered profiles than rankings.

### Details
The Angela Zhang test used five representative songs as chapters: early recognizability, piercing high notes, ballad storytelling, regret, and later-stage energy. This creates a clearer arc than listing many singers quickly.

### Suggested Action
For one-artist experiments, pick 4-6 songs and assign each a role in the artist arc. Keep text overlays short and let the source audio carry the experience.

### Metadata
- Source: conversation
- Related Files: `experiments/experiment-006/README.md`
- Tags: music, editing, single-artist-profile

---

## [LRN-20260513-001] best_practice

**Logged**: 2026-05-13T22:31:40+08:00
**Priority**: medium
**Status**: pending
**Area**: video

### Summary
Use conservative pitch language for vocal difficulty videos unless pitch has been formally verified.

### Details
The Angela Zhang TOP5 vocal difficulty demo uses musical-science overlays such as `参考峰值：C#6-D6 区间`. These labels improve the concept, but without a reliable pitch-detection workflow or score reference, they should remain clearly framed as local reference notes rather than official facts.

### Suggested Action
For publish-facing versions, add a pitch verification pass with manual listening, spectrogram/pitch tools, or score references. Until then, use words like `参考峰值`, `约`, and `区间`.

### Metadata
- Source: conversation
- Related Files: `experiments/experiment-008/README.md`
- Tags: music, pitch, editorial

---

## [LRN-20260513-002] best_practice

**Logged**: 2026-05-13T23:02:24+08:00
**Priority**: medium
**Status**: pending
**Area**: video

### Summary
Cap yt-dlp resolution during fast preview experiments to avoid slow high-resolution clip transcodes.

### Details
The Rainie Yang TOP5 demo downloaded four clips quickly, but the official `暧昧` MV was selected at a very high resolution by the default `bv*+ba/b` format rule. The resulting 40-second raw clip was much larger and slowed the workflow without improving the fast preview's final 1080x1920 output.

### Suggested Action
For sandbox preview scripts, prefer a bounded format such as `bv*[height<=1080]+ba/b[height<=1080]/b`. Keep full-resolution selection only for final refinements where visual quality matters.

### Metadata
- Source: observation
- Related Files: `experiments/experiment-009/run_log.md`
- Tags: yt-dlp, video, preview

---

## [LRN-20260513-003] best_practice

**Logged**: 2026-05-13T23:18:13+08:00
**Priority**: medium
**Status**: pending
**Area**: video

### Summary
Powerhouse singer difficulty videos should emphasize endurance and sustained pressure, not only the highest note.

### Details
The A-Mei TOP5 demo worked best when the overlays focused on sustained intensity, vocal weight, rock articulation, breath support, and belting stability. This differs from Rainie Yang's upper-middle-register control angle and Angela Zhang's high-note clarity angle.

### Suggested Action
For each singer, first define the actual difficulty profile, then choose songs and pitch labels. Avoid reusing the same high-note narrative across all artists.

### Metadata
- Source: observation
- Related Files: `experiments/experiment-010/run_log.md`
- Tags: music, vocal-analysis, editorial

---

## [LRN-20260513-004] correction

**Logged**: 2026-05-13T23:33:15+08:00
**Priority**: medium
**Status**: pending
**Area**: video

### Summary
For multi-singer vocal difficulty videos, choose true difficulty representatives rather than merely iconic songs.

### Details
The user challenged the initial David Tao choice by asking whether `普通朋友` is really that difficult. That was a good correction: the song is classic and rhythmically refined, but it is not persuasive as a highest-difficulty representative. The experiment switched to `黑色柳丁`, which better demonstrates rock/R&B pressure, groove, articulation, and vocal intensity.

### Suggested Action
Before selecting clips for a vocal difficulty roundup, define each singer's actual difficulty profile in one sentence, then choose the song that best proves that profile. Avoid defaulting to the most recognizable song when the premise is technical difficulty.

### Metadata
- Source: user_feedback
- Related Files: `experiments/experiment-011/run_log.md`
- Tags: music, vocal-analysis, editorial

---

## [LRN-20260513-005] correction

**Logged**: 2026-05-13T23:39:19+08:00
**Priority**: high
**Status**: pending
**Area**: video

### Summary
TOP ranking videos should count down to Top 1 instead of revealing Top 1 first.

### Details
The user pointed out that starting a TOP video with Top 1 removes the mystery. For music ranking and vocal-difficulty videos, the stronger short-video structure is to begin with the lowest included rank and reveal higher ranks progressively, saving Top 1 for the end.

### Suggested Action
For `TOP5`, `TOP10`, and similar ranked videos, default the edit order to `Top N -> ... -> Top 1`. Reflect this in the brief, overlay labels, render script order, and final contact sheet. Only use forward order when the user explicitly asks for it.

### Metadata
- Source: user_feedback
- Related Files: `AGENTS.md`
- Tags: music, editing, pacing, retention

---

## [LRN-20260515-001] correction

**Logged**: 2026-05-15T21:40:00+08:00
**Priority**: medium
**Status**: pending
**Area**: video

### Summary
Countdown order is an editing rule, not visible title copy.

### Details
The user corrected the opening title for Experiment 012: `倒数 TOP5` exposes internal pacing logic and is less natural as a viewer-facing title. The visible title should be topic-first, such as `张韶涵冷门歌曲 TOP5`, while the reverse reveal remains in the brief and render order.

### Suggested Action
For future TOP videos, keep titles clean and audience-facing. Put countdown/reverse-order requirements in project constraints, briefs, and scripts, not in the main title unless the user explicitly asks for that wording.

### Metadata
- Source: user_feedback
- Related Files: `experiments/experiment-012/render_deep_cuts_preview.sh`
- Tags: titles, editing, retention

---

## [LRN-20260516-001] best_practice

**Logged**: 2026-05-16T10:10:00+08:00
**Priority**: medium
**Status**: pending
**Area**: video

### Summary
Use a reusable Pillow + ffmpeg renderer for recurring creator TOP5 preview videos.

### Details
The creator/catalog roundup format has stabilized: five official-source chorus clips, reverse ranking reveal, compact lower thirds, performer and word/music credits, and a short memory label. Extracting the Pillow overlay and ffmpeg concat logic into `scripts/video/pillow_top5_renderer.py` lets new experiments provide only a clip manifest and copy, reducing duplicated rendering code.

### Suggested Action
For future `为别人创作的歌TOP5` or similar fixed-structure music rankings, start from the shared renderer and only branch to HyperFrames/Chrome when the video needs more complex motion, captions, or interactive composition features.

### Metadata
- Source: observation
- Related Files: `scripts/video/pillow_top5_renderer.py`, `experiments/experiment-025/render_top5_preview_pillow.py`
- Tags: music, rendering, templates

---

## [LRN-20260516-002] correction

**Logged**: 2026-05-16T13:34:53+08:00
**Priority**: medium
**Status**: pending
**Area**: video

### Summary
TOP video titles should be short, and only the `TOP5` ranking marker should break onto its own large line.

### Details
The user corrected the Experiment 026 title treatment: title text should stay compact, with only `TOP5` allowed as a separate large title line. Explanatory phrases and closing questions should not become long stacked headlines; they belong in subtitle-sized text or lower thirds.

### Suggested Action
Before rendering TOP videos, inspect intro and closing title strings. Keep the main title to one short audience-facing phrase, put `TOP5` on the only large second line, and move longer questions or explanations into smaller subtitle text.

### Metadata
- Source: user_feedback
- Related Files: `experiments/experiment-026/render_top5_preview_pillow.py`, `memory/learnings.md`
- Tags: titles, layout, music, editing

---

## [LRN-20260516-003] best_practice

**Logged**: 2026-05-16T13:52:24+08:00
**Priority**: medium
**Status**: pending
**Area**: video

### Summary
For live cover roundup videos, verify that selected sources have actual moving performance footage, not just official static audio art.

### Details
In Experiment 027, the Sandy Lam official channel source for `海阔天空` had live audio but the video was effectively a static cover image. It was better for listening credibility than visual momentum, so the preview switched to a same-performance live upload and documented the reason.

### Suggested Action
After downloading music/live sources, generate or inspect a contact sheet before final render. If the clip is static or visually weak, replace it with a better moving live source and keep the original candidate in source notes for traceability.

### Metadata
- Source: observation
- Related Files: `experiments/experiment-027/source_candidates.md`, `experiments/experiment-027/run_log.md`
- Tags: music, source-selection, qa, live-video

---
