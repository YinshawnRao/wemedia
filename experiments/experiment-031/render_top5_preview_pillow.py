#!/usr/bin/env python3
from __future__ import annotations

import sys
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT_DIR / "scripts/video"))

from pillow_top5_renderer import COLORS, render_top5_video  # noqa: E402


render_top5_video(
    experiment_id="experiment-031",
    output_slug="amei-top5-vocal-difficulty",
    intro={
        "eyebrow": "A-MEI VOCAL DIFFICULTY / TOP 5",
        "title_a": "张惠妹最难的歌",
        "title_b": "TOP5",
        "subtitle": "越燃越难，越顶越考验气息。",
        "note": "高压输出不是喊大声，是一路稳到最后。",
    },
    closing={
        "eyebrow": "NEXT TOPIC?",
        "title_a": "哪首最费气息？",
        "title_b": "",
        "subtitle": "阿妹的难，是爆发里还要稳。",
        "note": "下一期继续拆华语女声硬核现场。",
    },
    clips=[
        {
            "video_id": "YloYq5cZRig",
            "asset": "01-top5-amei-tomorrow",
            "fade_start": "33.2",
            "accent": COLORS["soft"],
            "header": "TOP 5 / 情绪长线",
            "song": "也许明天",
            "performer": "歌手：张惠妹",
            "credits": "难点：音域跨度 / 情绪推进 / 高音穿透",
            "detail": "越往后越燃，气息和声音都要撑住。",
            "source": "Timeless Music / Official MV",
        },
        {
            "video_id": "xrUyk79DLbg",
            "asset": "02-top4-amei-have-you-heard",
            "fade_start": "33.2",
            "accent": COLORS["support"],
            "header": "TOP 4 / 细腻推进",
            "song": "如果你也听说",
            "performer": "歌手：张惠妹",
            "credits": "难点：弱起推进 / 爆发收尾 / 情绪控制",
            "detail": "唱重了太满，唱轻了又没戏。",
            "source": "Timeless Music / Official MV",
        },
        {
            "video_id": "5O7hdU7ptmY",
            "asset": "03-top3-amei-bloody-love",
            "fade_start": "33.2",
            "accent": COLORS["highlight"],
            "header": "TOP 3 / 高音戏剧张力",
            "song": "血腥爱情故事",
            "performer": "歌手：张惠妹",
            "credits": "难点：高音区咬字 / 持续力量 / 戏剧张力",
            "detail": "副歌长期顶在高位，还要把字咬清楚。",
            "source": "Mei Entertainment / Official MV",
        },
        {
            "video_id": "cFvLq3rPeTk",
            "asset": "04-top2-amei-still-love-me",
            "fade_start": "33.2",
            "accent": COLORS["signal"],
            "header": "TOP 2 / 高压嘶吼",
            "song": "这样你还要爱我吗",
            "performer": "歌手：张惠妹",
            "credits": "难点：后段嘶吼 / 高音叠加 / 情绪崩塌感",
            "detail": "情绪可以崩，声音不能真的崩。",
            "source": "Mei Entertainment / Official MV",
        },
        {
            "video_id": "OvlWgjiQYpo",
            "asset": "05-top1-amei-rainbow",
            "fade_start": "33.2",
            "accent": COLORS["surface"],
            "header": "TOP 1 / Bridge气息战",
            "song": "彩虹",
            "performer": "歌手：张惠妹",
            "credits": "难点：低音稳定 / 连续呐喊 / Bridge气息",
            "detail": "从低处稳到高处爆，后半段几乎没喘口。",
            "source": "Mei Entertainment / Official Video",
        },
    ],
    contact_stamps=[2, 20, 54, 88, 122, 156, 178],
)

