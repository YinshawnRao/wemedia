# Source Candidates: Experiment 033

Search date: 2026-05-16

## Selected Sources

| Video Rank | Song | Selected URL | Channel | Duration | Planned Clip | Rights Status | Notes |
|---|---|---|---|---:|---|---|---|
| Top 5 | 不见不散 | https://www.youtube.com/watch?v=k9x4Ax-fz4A | EVERGRANDE MUSIC恆大音樂 | 3:42 | 00:02:42-00:03:16 | rights_review | HD 音乐视频/厂牌上传，后段副歌音区和咬字压力集中 |
| Top 4 | 风往北吹 | https://www.youtube.com/watch?v=4T-HSAZMPXg | NS Music Channel | 4:54 | 00:03:16-00:03:50 | rights_review | 原曲歌词视频，官方 MV/Topic 原曲源不易定位，先用于本地预览 |
| Top 3 | 你快回来 | https://www.youtube.com/watch?v=SkwKiJPtJxk | EVERGRANDE MUSIC恆大音樂 | 4:23 | 00:02:45-00:03:19 | rights_review | HD 音乐视频/厂牌上传，副歌呼喊感集中 |
| Top 2 | 燃烧 | https://www.youtube.com/watch?v=iZjVegLNEA0 | Sun Nan - Topic | 5:02 | 00:03:18-00:03:52 | rights_review | Topic 音频源，声音优先，后段真假声与高点集中 |
| Top 1 | 拯救 | https://www.youtube.com/watch?v=GfviQRY-UU0 | 孫楠 - Topic | 5:33 | 00:04:10-00:04:44 | rights_review | Topic 音频源，声音优先，后段持续声压集中 |

## Backup Candidates

| Song | Candidate | Channel | Duration | Notes |
|---|---|---|---:|---|
| 拯救 | https://www.youtube.com/watch?v=3kkaW0hKB1Y | nøise | 5:58 | 标题标注 Official Music Video，但频道非官方，作为画面备选 |
| 拯救 | https://www.youtube.com/watch?v=cjCQWi3VjCI | 浙江卫视音乐频道 ZJSTV Music Channel | 5:09 | 官方节目上传/现场源，可作 live 备选 |
| 燃烧 | https://www.youtube.com/watch?v=474dolbRpR8 | Henry Hsu | 5:14 | 非官方 MV 备选，画面信息较多但来源优先级低 |
| 燃烧 | https://www.youtube.com/watch?v=OjIsHKC7lhs | 湖南卫视芒果TV官方频道 | 4:47 | 2025 合唱舞台，官方节目源但不是原曲独唱 |
| 你快回来 | https://www.youtube.com/watch?v=emdlcZYjP8Y | nøise | 4:23 | 标题标注 Official Music Video，但频道非官方，作为画面备选 |
| 你快回来 | https://www.youtube.com/watch?v=hpGOV_0bGSA | SMG上海电视台官方频道 | 4:27 | 官方节目合唱源，可作 live 备选 |
| 风往北吹 | https://www.youtube.com/watch?v=GZC2JplFadY | 孫楠 - Topic | 4:38 | Topic live 源，官方性更高但不是原曲独唱版本 |
| 风往北吹 | https://www.youtube.com/watch?v=a24wjM36TmY | 芒果TV音乐 MangoTV Music | 1:01:48 | 官方节目 loop，需避免超长 loop 作为首选 |
| 不见不散 | https://www.youtube.com/watch?v=NGvea-o7sfQ | 中国四川广播电视台 China SiChuanTV Official Channel | 3:46 | 官方节目现场源，可作 live 备选 |
| 不见不散 | https://www.youtube.com/watch?v=teSlyv9iZiQ | 和音乐一起长大的日子 | 3:53 | 非官方老视频备选 |

## Download Plan

All planned downloads use test mode and write temporary files to `sandbox/yt-dlp/clips/experiment-033/`.

```text
yt-dlp defaults:
--cookies-from-browser chrome
--js-runtimes node
--merge-output-format mp4
--download-sections
--force-keyframes-at-cuts
--no-write-subs
--no-write-auto-subs
```

This experiment skips subtitle download because the preview uses source audio and custom overlay copy only.

## Download Result

Downloaded 5 planned clips to:

```text
sandbox/yt-dlp/clips/experiment-033/
```

Created preview exports:

```text
sandbox/exports/experiment-033/sun-nan-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-033/sun-nan-top5-vocal-difficulty-contact-sheet.jpg
```

Download notes:

- Top 5 `不见不散`: downloaded with metadata.
- Top 4 `风往北吹`: downloaded with metadata.
- Top 3 `你快回来`: downloaded with metadata.
- Top 2 `燃烧`: downloaded with metadata.
- Top 1 `拯救`: downloaded with metadata.
- Subtitles were intentionally skipped for this local preview because the visible copy is custom written.
