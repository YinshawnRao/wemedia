# Production Workflow

## Current Default: Local Test Mode

Unless the user explicitly asks for formal ingestion or publishing output, all video experiments are personal local test demos:

- experiment records go to `experiments/experiment-XXX/`
- temporary media goes to `sandbox/`
- exports go to `sandbox/exports/experiment-XXX/`
- formal directories such as `downloads/`, `clips/`, `audio/`, `subtitles/`, and `assets/exports/` are not used for test demos

Before starting a new video task, read `AGENTS.md` and `memory/video-production-contract.md`.

## 1. Research

Use `prompts/01-video-resource-research.md` to gather candidate videos. Save the final candidate list as JSONL or Markdown under `data/sources/`.

Each source record should include:

- topic
- source URL
- video title
- channel or publisher
- publish date
- candidate time ranges
- why it is useful
- rights status: `allowed`, `cc`, `permission_needed`, `rights_review`, or `rejected`

## 2. Download

Before downloading, create a short plan with:

- exact URL
- slug
- start and end time
- intended use in the edit
- expected output folder
- rights note

During the current exploration phase, run helpers with `WEMEDIA_OUTPUT_MODE=test` semantics so temporary outputs go to `sandbox/yt-dlp/`.

Use the helpers in `scripts/yt-dlp/` for consistent output:

- full videos: `downloads/<slug>/`
- time-range clips: `clips/<slug>/`
- extracted audio: `audio/<slug>/`
- subtitles: `subtitles/<slug>/`
- archives and run logs: `logs/`

## 3. Log and Transcribe

Keep transcripts in `data/transcripts/`. Keep selected clip notes in `data/clips/`.

Good clip notes answer:

- What happens in the clip?
- Why is it useful?
- What is the exact time range?
- Does it need subtitles, translation, or on-screen attribution?

## 4. Edit Brief

Use `prompts/03-editing-brief.md` before building the HyperFrames composition. Save the brief in `data/briefs/<video-slug>.md`.

The brief should lock:

- hook
- narrative beats
- clip order
- caption style
- aspect ratio
- duration
- voiceover plan
- music or sound design notes

## 5. HyperFrames Build

Create one HyperFrames project per finished video under `hyperframes/projects/<video-slug>/`.

Follow the root `DESIGN.md` unless the video brief defines a stronger, user-approved style. Keep reusable snippets, caption rules, and shared helpers under `hyperframes/shared/`.

## 6. QA and Export

Before local demo delivery:

- render a preview MP4
- render a contact sheet
- check structure/order
- check visible copy for internal wording
- check audio exists
- check attribution and source manifest
- keep demo exports in `sandbox/exports/<experiment-id>/`

Only export final files to `assets/exports/<video-slug>/` after the user explicitly asks for formal output.
