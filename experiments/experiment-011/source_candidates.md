# Source Candidates

Experiment: `experiment-011`

Status: `rights_review`

All candidates are for local sandbox workflow validation only.

| Singer | Song | URL | Channel | Clip Range | Reason |
|---|---|---|---|---|---|
| 周杰伦 | 搁浅 | https://www.youtube.com/watch?v=YJfHuATJYsQ | 周杰倫 Jay Chou | 00:02:55-00:03:35 | 尾段副歌高位集中，兼具高音、咬字和情绪推进。 |
| 王力宏 | 你不在 | https://www.youtube.com/watch?v=_OP1roi1_Fs | 王力宏 Wang Leehom | 00:03:03-00:03:43 | 尾段强混声和大跳更集中，适合作为王力宏难度代表。 |
| 陶喆 | 黑色柳丁 | https://www.youtube.com/watch?v=VC4KT__tx5g | Timeless Music | 00:02:45-00:03:25 | 高压摇滚/R&B 混合唱法，比 `普通朋友` 更适合难度盘点。 |
| 林俊杰 | 不为谁而作的歌 | https://www.youtube.com/watch?v=gd38-X3HpbM | JJ Lin林俊傑 | 00:03:43-00:04:23 | 尾段高位混声长线，音色稳定和气息支撑都很吃力。 |

## Runtime Notes

- Use `WEMEDIA_OUTPUT_MODE=test`.
- Download with `--cookies-from-browser chrome --js-runtimes node`.
- This experiment caps test download format at 1080p via `YTDLP_FORMAT`.
- Keep all sources under `rights_review`.
- If any clip misses the target phrase, adjust only the clip range and rerun the scripts.
