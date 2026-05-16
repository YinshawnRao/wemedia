# Naming Rules

Use stable, searchable slugs:

```text
<topic>-<angle>-<yyyymmdd>
```

Examples:

```text
ai-agents-tool-use-20260510
creator-economy-youtube-shorts-20260510
```

## Media Paths

Current local-test experiment paths:

```text
experiments/experiment-XXX/
sandbox/yt-dlp/clips/experiment-XXX/
sandbox/hyperframes/experiment-XXX/
sandbox/exports/experiment-XXX/
data/sources/experiment-XXX_sources.md
data/briefs/<video-slug>.md
hyperframes/projects/<video-slug>/
```

Formal media paths, used only when explicitly requested:

```text
downloads/<slug>/
clips/<slug>/
audio/<slug>/
subtitles/<slug>/
assets/processed/clips/<slug>/
assets/processed/audio/<slug>/
assets/processed/stills/<slug>/
assets/exports/<slug>/
hyperframes/projects/<slug>/
data/briefs/<slug>.md
```

## Clip IDs

Use:

```text
clip-001
clip-002
clip-003
```

When a clip is tied to a source, include the source id in manifests:

```text
src-001 -> clip-001
```
