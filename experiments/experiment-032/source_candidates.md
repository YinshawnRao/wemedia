# Source Candidates: Experiment 032

Search date: 2026-05-16

## Selected Sources

| Video Rank | Song | Selected URL | Channel | Duration | Planned Clip | Rights Status | Notes |
|---|---|---|---|---:|---|---|---|
| Top 5 | 无条件为你 | https://www.youtube.com/watch?v=XPD-0b66Wv4 | 滾石唱片 ROCK RECORDS | 4:21 | 00:02:58-00:03:32 | rights_review | Official Music Video，副歌清透高位较集中 |
| Top 4 | 情歌 | https://www.youtube.com/watch?v=itjyryJ-8IU | 梁靜茹 Fish Leong | 4:21 | 00:02:52-00:03:26 | rights_review | 歌手官方/Topic 音频源，适合保留声音质感 |
| Top 3 | 崇拜 | https://www.youtube.com/watch?v=TUXD13PSebw | 梁靜茹 Fish Leong | 3:58 | 00:02:48-00:03:22 | rights_review | 歌手官方/Topic 音频源，后段情绪推进集中 |
| Top 2 | 丝路 | https://www.youtube.com/watch?v=LwaZVMERWdQ | 滾石唱片 ROCK RECORDS | 4:59 | 00:03:26-00:04:00 | rights_review | Official Music Video，副歌打开和大歌气息集中 |
| Top 1 | 燕尾蝶 | https://www.youtube.com/watch?v=KAn2ejVJlE0 | 滾石唱片 ROCK RECORDS | 5:16 | 00:03:24-00:03:58 | rights_review | Official Music Video，连续高位副歌适合作为 Top1 |

## Backup Candidates

| Song | Candidate | Channel | Duration | Notes |
|---|---|---|---:|---|
| 无条件为你 | https://www.youtube.com/watch?v=idTwNCC9pvU | ROCK RECORDS English | 4:21 | 英文字幕版官方 MV 备选 |
| 情歌 | https://www.youtube.com/watch?v=7FiQV1-z06Q | 柏呈昇 | 4:19 | 非官方字幕 MV，画面信息更接近 MV，但来源优先级低 |
| 情歌 | https://www.youtube.com/watch?v=uUd7aso8jnA | Music Life | 4:21 | 非官方 4K 版，作为画面备选 |
| 崇拜 | https://www.youtube.com/watch?v=KKRqKsjqySI | 柏呈昇 | 5:35 | 非官方 MV 备选，画面信息更多但来源优先级低 |
| 崇拜 | https://www.youtube.com/watch?v=N1j07rDWLmQ | 梁靜茹 Fish Leong | 4:23 | 歌手官方/Topic 另一个版本备选 |
| 丝路 | https://www.youtube.com/watch?v=TotB9UgaIco | 滾石唱片 ROCK RECORDS | 45:50 | 官方专辑合集备选 |
| 燕尾蝶 | https://www.youtube.com/watch?v=VGW-EUhjIao | Randy M. | 3:50 | 现场合唱备选，但来源优先级低 |

## Download Plan

All planned downloads use test mode and write temporary files to `sandbox/yt-dlp/clips/experiment-032/`.

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
sandbox/yt-dlp/clips/experiment-032/
```

Created preview exports:

```text
sandbox/exports/experiment-032/fish-leong-top5-vocal-difficulty-preview.mp4
sandbox/exports/experiment-032/fish-leong-top5-vocal-difficulty-contact-sheet.jpg
```

Download notes:

- Top 5 `无条件为你`: downloaded with metadata.
- Top 4 `情歌`: downloaded with metadata.
- Top 3 `崇拜`: downloaded with metadata.
- Top 2 `丝路`: downloaded with metadata.
- Top 1 `燕尾蝶`: downloaded with metadata.
- Subtitles were intentionally skipped for this local preview because the visible copy is custom written.
