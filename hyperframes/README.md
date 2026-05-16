# HyperFrames Workspace

Create one project per video under:

```text
hyperframes/projects/<video-slug>/
```

Recommended setup:

```bash
npx hyperframes init hyperframes/projects/<video-slug> --non-interactive
```

Before writing composition HTML, read:

- root `DESIGN.md`
- `data/briefs/<video-slug>.md`
- relevant source and clip manifests

Checks before delivery:

```bash
npx hyperframes lint
npx hyperframes inspect
npx hyperframes preview
npx hyperframes render --quality standard
```

Final renders should be copied or configured to land in:

```text
assets/exports/<video-slug>/
```

