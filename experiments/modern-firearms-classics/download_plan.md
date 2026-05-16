# Download Plan

Experiment: `modern-firearms-classics`

Mode: local test. Start with `WEMEDIA_OUTPUT_MODE=test` so yt-dlp outputs go to `sandbox/yt-dlp/`. If the test cut is good, promote only the final selected clips into the HyperFrames project assets.

## Planned Clip Downloads

| Segment | URL | Slug | Start | End | Intended use | Expected test path | Rights / risk note |
|---|---|---|---:|---:|---|---|---|
| M107 | https://www.dvidshub.net/video/1003081/v28-m107-50-caliber-rifle-range | `modern-firearms-m107` | 00:00:05 | 00:00:20 | TOP5 opening segment; long-range precision / anti-materiel role. | `sandbox/yt-dlp/clips/modern-firearms-m107/` | DVIDS public domain; local test. |
| M249 | https://www.dvidshub.net/video/892442/m249-range-b-roll | `modern-firearms-m249-broll` | 00:00:00 | 00:00:15 | Squad automatic weapon segment; final composition starts at 00:00:03 to skip slate. | `sandbox/yt-dlp/clips/modern-firearms-m249-broll/` | DVIDS public domain; visually verified clear M249 frames. |
| M240 | https://www.dvidshub.net/video/963888/mass-2-marines-train-with-m240b-machine-guns-during-live-fire-range | `modern-firearms-m240` | 00:00:04 | 00:00:18 | Medium machine gun segment. | `sandbox/yt-dlp/clips/modern-firearms-m240/` | DVIDS public domain; local test. |
| M4 | https://www.dvidshub.net/video/977700/b-roll-soldiers-train-m4-carbine-and-m320-grenade-launcher-during-e2b | `modern-firearms-m4-close` | 00:00:00 | 00:00:15 | M4/M16 family segment with close-up weapon footage. | `sandbox/yt-dlp/clips/modern-firearms-m4-close/` | DVIDS public domain; visually verified clear M4 frames. |
| AK-47 | https://www.dvidshub.net/video/702160/ak-47-assault-rifle-range | `modern-firearms-ak47-later` | 00:00:22 | 00:00:45 | Countdown No.1; global proliferation / rugged design segment; final composition starts at 00:00:23. | `sandbox/yt-dlp/clips/modern-firearms-ak47-later/` | DVIDS public domain; later range visually verified clearer than initial pull. |

## Commands

Run each command from repo root:

```bash
WEMEDIA_OUTPUT_MODE=test ./scripts/yt-dlp/download-clip.sh "https://www.dvidshub.net/video/1003081/v28-m107-50-caliber-rifle-range" "modern-firearms-m107" "00:00:05" "00:00:20"
WEMEDIA_OUTPUT_MODE=test ./scripts/yt-dlp/download-clip.sh "https://www.dvidshub.net/video/892442/m249-range-b-roll" "modern-firearms-m249-broll" "00:00:00" "00:00:15"
WEMEDIA_OUTPUT_MODE=test ./scripts/yt-dlp/download-clip.sh "https://www.dvidshub.net/video/963888/mass-2-marines-train-with-m240b-machine-guns-during-live-fire-range" "modern-firearms-m240" "00:00:04" "00:00:18"
WEMEDIA_OUTPUT_MODE=test ./scripts/yt-dlp/download-clip.sh "https://www.dvidshub.net/video/977700/b-roll-soldiers-train-m4-carbine-and-m320-grenade-launcher-during-e2b" "modern-firearms-m4-close" "00:00:00" "00:00:15"
WEMEDIA_OUTPUT_MODE=test ./scripts/yt-dlp/download-clip.sh "https://www.dvidshub.net/video/702160/ak-47-assault-rifle-range" "modern-firearms-ak47-later" "00:00:22" "00:00:45"
```

## Post-Download Checks

- Confirm each clip contains the named firearm visibly in frame.
- Keep original `.info.json`, `.description`, and thumbnail files produced by yt-dlp.
- Copy only the selected `.mp4` files into `hyperframes/projects/modern-firearms-classics/assets/`.
- If a range is weak, update only the range in this plan and rerun that single slug.
