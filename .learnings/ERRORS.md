# Errors

## [ERR-20260510-001] hyperframes_long_render

**Logged**: 2026-05-10T14:30:00+08:00
**Priority**: medium
**Status**: pending
**Area**: video

### Summary
HyperFrames full render was too slow for a 282.5 second music roundup.

### Error
```text
BeginFrame auto-worker calibration timed out.
Reduced auto worker count for high-cost capture workload to 1.
```

### Context
- Task: render `sandbox/hyperframes/experiment-003/index.html`
- Output target: `sandbox/exports/experiment-003/chinese-female-singers-long-chorus-demo.mp4`
- The render was stopped and replaced with a faster ffmpeg preview export.

### Suggested Fix
Use fast ffmpeg previews for long-form pacing checks, or reduce duration/fps before attempting a full HyperFrames render.

### Metadata
- Reproducible: yes
- Related Files: `sandbox/hyperframes/experiment-003/index.html`

---

## [ERR-20260516-009] rg_backtick_pattern_shell_expansion

**Logged**: 2026-05-16T16:35:13+08:00
**Priority**: low
**Status**: resolved
**Area**: docs

### Summary
An `rg` verification command used backticks inside a double-quoted pattern, causing zsh command substitution.

### Error
```text
zsh:1: command not found: zm_yunxi
```

### Context
- Command attempted to search for stale docs containing a literal `` `zm_yunxi` `` pattern.
- The shell interpreted the backticked text before `rg` ran.
- Resolution: avoid backticks in double-quoted shell patterns, or quote the pattern safely.

### Suggested Fix
Use single-quoted patterns or remove Markdown backticks when searching for literal inline-code text.

### Metadata
- Reproducible: yes
- Related Files: `AGENTS.md`, `memory/video-production-contract.md`

---

## [ERR-20260510-003] node_template_literal_escape

**Logged**: 2026-05-10T22:20:00+08:00
**Priority**: low
**Status**: resolved
**Area**: video

### Summary
Experiment 004 generator failed before execution because markdown backticks inside a JavaScript template literal were double-escaped.

### Error
```text
SyntaxError: missing ) after argument list
```

### Context
- Task: generate 10 Chinese ancient-history HyperFrames projects.
- File: `sandbox/notes/experiment-004/build_history_shorts.mjs`
- Cause: using `\\`` inside a template literal leaves an escaped backslash and terminates the template; the correct escape is `\``.

### Suggested Fix
When generating markdown from JavaScript template literals, escape embedded backticks with a single backslash or use an array of lines joined with `\n`.

### Metadata
- Reproducible: yes
- Related Files: `sandbox/notes/experiment-004/build_history_shorts.mjs`

---

## [ERR-20260510-004] commons_special_filepath_403

**Logged**: 2026-05-10T22:28:00+08:00
**Priority**: medium
**Status**: resolved
**Area**: video

### Summary
Wikimedia Commons `Special:FilePath` downloads returned a 403 Too Many Requests response during batch asset collection.

### Error
```text
Download failed 403 Too Many Reqs: https://commons.wikimedia.org/wiki/Special:FilePath/Qinshihuang.jpg
```

### Context
- Task: download open images for Experiment 004 history shorts.
- File: `sandbox/notes/experiment-004/build_history_shorts.mjs`
- Workaround: resolve Commons files through the MediaWiki API `imageinfo.url` first, then download the returned upload URL with an explicit user agent.

### Suggested Fix
For future Commons batch downloads, avoid `Special:FilePath`; use the API to resolve file URLs and keep requests sequential.

### Metadata
- Reproducible: yes
- Related Files: `sandbox/notes/experiment-004/build_history_shorts.mjs`

---

## [ERR-20260510-005] world_bank_archived_co2_api

**Logged**: 2026-05-10T23:10:00+08:00
**Priority**: medium
**Status**: resolved
**Area**: data

### Summary
World Bank CO2 total emissions indicator `EN.ATM.CO2E.KT` is still visible on data pages but returned an archived/deleted response through the Indicators API.

### Error
```text
The indicator was not found. It may have been deleted or archived.
```

### Context
- Task: build Experiment 005 dynamic country-ranking videos from World Bank API data.
- Failed topic: CO2 emissions top countries.
- Resolution: replaced the CO2 sample with `AG.PRD.CREL.MT` cereal production, which is available through the same API.

### Suggested Fix
Before committing to World Bank ranking topics, smoke-test every indicator endpoint and keep a replacement shortlist.

### Metadata
- Reproducible: yes
- Related Files: `sandbox/notes/experiment-005/build_bar_race_shorts.mjs`

---

## [ERR-20260510-002] ffmpeg_text_overlay

**Logged**: 2026-05-10T14:30:00+08:00
**Priority**: medium
**Status**: pending
**Area**: video

### Summary
Current ffmpeg build cannot draw text or decode SVG overlays directly.

### Error
```text
No such filter: drawtext
Decoding requested, but no decoder found for: svg
```

### Context
- Task: create lower-third text overlays for a long music preview.
- Workaround: generate SVG overlays, render them to PNG with Chrome headless, then use ffmpeg `overlay`.

### Suggested Fix
Keep using the Chrome PNG overlay path unless ffmpeg is rebuilt with `drawtext` and SVG decoding support.

### Metadata
- Reproducible: yes
- Related Files: `experiments/experiment-003/render_ffmpeg_preview.sh`

---

## [ERR-20260510-005] npx_hyperframes_sandbox_network

**Logged**: 2026-05-10T23:45:00+08:00
**Priority**: medium
**Status**: resolved
**Area**: video

### Summary
Running `npx hyperframes lint` inside the restricted sandbox failed because npm could not resolve the configured registry host.

### Error
```text
npm error code ENOTFOUND
npm error network request to https://registry.npmmirror.com/hyperframes failed
```

### Context
- Task: validate the Angela Zhang HyperFrames project.
- Environment: workspace sandbox with restricted network.
- Workaround: rerun HyperFrames CLI with approved elevated permissions.

### Suggested Fix
When HyperFrames CLI falls back to npm registry access, rerun with approved permissions using the `npx hyperframes` prefix rather than waiting on a hung sandbox invocation.

### Metadata
- Reproducible: yes
- Related Files: `sandbox/hyperframes/experiment-006/index.html`

---

## [ERR-20260513-001] youtube_cookie_bot_verification

**Logged**: 2026-05-13T22:31:40+08:00
**Priority**: medium
**Status**: resolved
**Area**: video

### Summary
YouTube rejected yt-dlp clip downloads until the Chrome browser session was refreshed.

### Error
```text
Sign in to confirm you're not a bot
```

### Context
- Task: download five Angela Zhang clips for Experiment 008.
- Command pattern: `yt-dlp --cookies-from-browser chrome --js-runtimes node`.
- Resolution: user re-logged into Chrome, then the same download script completed successfully.

### Suggested Fix
When this appears, first confirm Chrome is logged in and cookies are readable before changing the yt-dlp installation or rewriting the workflow.

### Metadata
- Reproducible: unknown
- Related Files: `experiments/experiment-008/download_clips.sh`
- See Also: `memory/learnings.md`

---

## [ERR-20260515-001] parallel_ytdlp_sandbox_semaphore

**Logged**: 2026-05-15T21:36:23+08:00
**Priority**: low
**Status**: resolved
**Area**: video

### Summary
Parallel yt-dlp search commands failed inside the sandbox because the PyInstaller binary could not initialize a sync semaphore.

### Error
```text
[PYI-61162:ERROR] Failed to initialize sync semaphore!
semctl: Operation not permitted
```

### Context
- Task: search YouTube sources for Experiment 012.
- Command pattern: multiple `yt-dlp --flat-playlist` searches launched in parallel.
- Resolution: reran yt-dlp searches sequentially with approved local permissions; all searches completed.

### Suggested Fix
Avoid parallel yt-dlp invocations in the restricted sandbox. Run yt-dlp searches and downloads sequentially, and use approved local permissions when the PyInstaller semaphore error appears.

### Metadata
- Reproducible: yes
- Related Files: `experiments/experiment-012/run_log.md`

---

## [ERR-20260516-001] python_pycompile_cache_outside_sandbox

**Logged**: 2026-05-16T01:14:00+08:00
**Priority**: low
**Status**: resolved
**Area**: tooling

### Summary
`python3 -m py_compile` failed because macOS Python tried to write bytecode cache under `~/Library/Caches`, which is outside the writable sandbox.

### Error
```text
PermissionError: [Errno 1] Operation not permitted: '/Users/yinshawnrao/Library/Caches/com.apple.python/...'
```

### Context
- Task: syntax-check `experiments/experiment-024/render_top5_preview_pillow.py`.
- Resolution: reran the check with `PYTHONPYCACHEPREFIX=/Users/yinshawnrao/explorer/wemedia/sandbox/pycache`.

### Suggested Fix
When running Python compile checks in this workspace, set `PYTHONPYCACHEPREFIX` to a path under `sandbox/` so pycache writes stay inside the project.

### Metadata
- Reproducible: yes
- Related Files: `experiments/experiment-024/render_top5_preview_pillow.py`

---

## [ERR-20260516-002] youtube_dns_resolution_retry

**Logged**: 2026-05-16T14:10:00+08:00
**Priority**: low
**Status**: resolved
**Area**: video

### Summary
yt-dlp temporarily failed to resolve `www.youtube.com` during Experiment 028 batch clip download.

### Error
```text
Failed to resolve 'www.youtube.com' ([Errno 8] nodename nor servname provided, or not known)
```

### Context
- Task: download李玟 `ThR4kOGHYpI` clip for Experiment 028.
- The batch command continued downloading the other four clips successfully.
- Resolution: reran the same URL and cut point as a single download; it succeeded.

### Suggested Fix
For transient YouTube DNS failures, retry the same URL and time range once as a standalone command before replacing the source.

### Metadata
- Reproducible: no
- Related Files: `experiments/experiment-028/run_log.md`

---

## [ERR-20260516-003] youtube_subtitle_http_429

**Logged**: 2026-05-16T14:48:00+08:00
**Priority**: low
**Status**: resolved
**Area**: video

### Summary
yt-dlp failed while downloading subtitles for the Top1 `彩虹` clip in Experiment 031, but the media clip itself was still downloadable.

### Error
```text
ERROR: Unable to download video subtitles for 'en': HTTP Error 429: Too Many Requests
```

### Context
- Task: download 張惠妹/AMIT `彩虹` clip from `OvlWgjiQYpo`, section `00:02:35-00:03:09`.
- The first run requested metadata, thumbnails, and subtitles.
- Resolution: reran the same URL and section with subtitle download disabled, then patched the experiment download script to use the no-subtitle path for this clip.

### Suggested Fix
When subtitles are not required for a music preview and YouTube returns HTTP 429 during subtitle retrieval, retry the same source and time range without subtitles before replacing the source.

### Metadata
- Reproducible: unknown
- Related Files: `experiments/experiment-031/download_clips.sh`, `experiments/experiment-031/run_log.md`

---
## [ERR-20260516-001] bash_printf_dash_format

**Logged**: 2026-05-16T00:00:00+08:00
**Priority**: low
**Status**: fixed
**Area**: scripts

### Summary
`printf` with a format string beginning with `-` failed in the benchmark environment script.

### Error
```text
printf: - : invalid option
printf: usage: printf [-v var] format [arguments]
```

### Context
- Command/operation attempted: `tts-local-benchmark/scripts/check_env.sh tts-local-benchmark/env_report.md`
- Related file: `tts-local-benchmark/scripts/check_env.sh`

### Suggested Fix
Use `printf '%s\n' '- text'` for literal markdown bullets instead of using the bullet line itself as the format string.

### Metadata
- Reproducible: yes
- Related Files: `tts-local-benchmark/scripts/check_env.sh`

---

## [ERR-20260516-002] shell_version_probe_duplicate_command

**Logged**: 2026-05-16T00:00:00+08:00
**Priority**: low
**Status**: fixed
**Area**: scripts

### Summary
The environment checker passed the executable name twice to a helper, producing false version errors such as `python3 python3 --version`.

### Error
```text
python3: can't open file '/Users/.../python3'
git: 'git' is not a git command
```

### Context
- Command/operation attempted: `tts-local-benchmark/scripts/check_env.sh tts-local-benchmark/env_report.md`
- Related file: `tts-local-benchmark/scripts/check_env.sh`

### Suggested Fix
Call the helper as `value_or_missing python3 --version` and let it run `"$@"` after checking only the first argument exists.

### Metadata
- Reproducible: yes
- Related Files: `tts-local-benchmark/scripts/check_env.sh`

---

## [ERR-20260516-003] relative_venv_path_wrong_workdir

**Logged**: 2026-05-16T00:00:00+08:00
**Priority**: low
**Status**: fixed
**Area**: scripts

### Summary
A relative virtualenv path failed after changing the working directory for MeloTTS.

### Error
```text
zsh:1: no such file or directory: tts-local-benchmark/vendor/melotts/venv/bin/python
```

### Context
- Command/operation attempted: `tts-local-benchmark/vendor/melotts/venv/bin/python -m unidic download`
- Working directory: `tts-local-benchmark/vendor/melotts/MeloTTS`

### Suggested Fix
Use absolute paths for virtualenv executables when changing working directories.

### Metadata
- Reproducible: yes
- Related Files: `tts-local-benchmark`

---

## [ERR-20260516-004] melotts_typer_extra_and_inference_stall

**Logged**: 2026-05-16T00:00:00+08:00
**Priority**: medium
**Status**: pending
**Area**: tts

### Summary
MeloTTS installed on macOS arm64 but first Chinese inference did not produce audio.

### Error
```text
pkg_resources.UnknownExtra: typer 0.23.2 has no such extra feature 'all'
```

### Context
- Official `pip install -e .` selected `typer 0.23.2`; pinning `typer[all]==0.9.0` fixed CLI startup.
- Both CLI and Python API then loaded the Chinese model but stalled during first inference without writing a WAV.

### Suggested Fix
Retry in a clean Python 3.10/3.11 environment, preferably without WebUI/Gradio dependencies if only CLI/API inference is needed.

### Metadata
- Reproducible: unknown
- Related Files: `tts-local-benchmark/outputs/melotts/status.json`

---

## [ERR-20260516-005] chattts_ui_torch_version_deadlock

**Logged**: 2026-05-16T00:00:00+08:00
**Priority**: medium
**Status**: pending
**Area**: tts

### Summary
ChatTTS-ui installed and downloaded most model assets, but local API startup did not complete on macOS arm64.

### Error
```text
AttributeError: module 'torch.serialization' has no attribute 'FILE_LIKE'
```

### Context
- README-recommended `torch==2.2.0` conflicted with current `vector-quantize-pytorch>=1.29.0` and hung before port 9966 opened.
- `torch==2.8.0` failed immediately because ChatTTS code references removed `torch.serialization.FILE_LIKE`.
- `torch==2.4.1` avoided the immediate error but still hung during model loading.

### Suggested Fix
Try a known-good commit/release of ChatTTS-ui with pinned dependencies, or use the project’s Docker CPU image instead of source install on macOS.

### Metadata
- Reproducible: unknown
- Related Files: `tts-local-benchmark/outputs/chattts-ui/status.json`

---

## [ERR-20260516-006] cosyvoice_python_version_requirements

**Logged**: 2026-05-16T00:00:00+08:00
**Priority**: medium
**Status**: pending
**Area**: tts

### Summary
CosyVoice official dependencies could not be installed without a Python 3.10 conda environment.

### Error
```text
ERROR: No matching distribution found for gradio==5.4.0
ModuleNotFoundError: No module named 'pkg_resources'
```

### Context
- System Python 3.9 cannot install `gradio==5.4.0`.
- Bundled Python 3.12 fails building `grpcio==1.57.0`.
- Official docs recommend conda with Python 3.10.

### Suggested Fix
Install Miniconda or use a Python 3.10 manager, then retry official `pip install -r requirements.txt` and `FunAudioLLM/Fun-CosyVoice3-0.5B-2512` or `CosyVoice2-0.5B`.

### Metadata
- Reproducible: yes
- Related Files: `tts-local-benchmark/outputs/cosyvoice/status.json`

---

## [ERR-20260516-007] gpt_sovits_no_conda_no_models

**Logged**: 2026-05-16T00:00:00+08:00
**Priority**: medium
**Status**: pending
**Area**: tts

### Summary
GPT-SoVITS dependencies installed manually, but the official installer and WebUI flow did not complete.

### Error
```text
[ERROR]: Conda Not Found
```

### Context
- `install.sh --device CPU --source HF` exits immediately without conda.
- Manual venv installation of `extra-req.txt` and `requirements.txt` succeeded.
- Pretrained models and G2PW assets were not downloaded because the official installer did not run.
- WebUI startup hung without reaching a usable service.

### Suggested Fix
Use a conda Python 3.10 environment and rerun `bash install.sh --device CPU --source HF`, then test only with user-owned or included sample reference audio.

### Metadata
- Reproducible: yes
- Related Files: `tts-local-benchmark/outputs/gpt-sovits/status.json`

---

## [ERR-20260516-005] git_init_sandbox_permission

**Logged**: 2026-05-16T15:45:00+08:00
**Priority**: low
**Status**: resolved
**Area**: config

### Summary
`git init` failed inside the restricted command sandbox when creating the `.git` metadata directory.

### Error
```text
/Users/yinshawnrao/explorer/wemedia/.git: Operation not permitted
```

### Context
- Command/operation attempted: `git init`
- Working directory: `/Users/yinshawnrao/explorer/wemedia`
- Resolution: reran the same command with approved local permissions; Git initialized normally.

### Suggested Fix
If initializing a repository in this workspace fails with `Operation not permitted`, request approved local permissions for `git init` and then continue with normal Git commands.

### Metadata
- Reproducible: unknown
- Related Files: `.gitignore`, `README.md`

---

## [ERR-20260516-008] ytdlp_sandbox_semaphore_repro

**Logged**: 2026-05-16T16:25:19+08:00
**Priority**: low
**Status**: resolved
**Area**: video

### Summary
`yt-dlp` again failed inside the restricted sandbox because its PyInstaller binary could not initialize a sync semaphore.

### Error
```text
[PYI-3201:ERROR] Failed to initialize sync semaphore!
semctl: Operation not permitted
```

### Context
- Task: smoke-check `yt-dlp --version` before Experiment 033 source search and downloads.
- Working directory: `/Users/yinshawnrao/explorer/wemedia`.
- Resolution: reran yt-dlp searches and downloads sequentially with approved local permissions.

### Suggested Fix
When this semaphore error appears, use approved local permissions for yt-dlp and keep searches/downloads sequential.

### Metadata
- Reproducible: yes
- Related Files: `experiments/experiment-033/run_log.md`
- See Also: `ERR-20260515-001`

---
