#!/usr/bin/env python3
from __future__ import annotations

import sys
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT_DIR / "scripts/video"))

from pillow_top5_renderer import COLORS, render_top5_video  # noqa: E402


render_top5_video(
    experiment_id="experiment-029",
    output_slug="eason-top5-vocal-difficulty",
    intro={
        "eyebrow": "EASON VOCAL DIFFICULTY / TOP 5",
        "title_a": "陈奕迅最难的歌",
        "title_b": "TOP5",
        "subtitle": "听着会唱，开口才知道多难。",
        "note": "高音只是表面，气息和控制才是本体。",
    },
    closing={
        "eyebrow": "NEXT TOPIC?",
        "title_a": "你觉得哪首最难？",
        "title_b": "",
        "subtitle": "下一期继续拆华语男声难唱现场。",
        "note": "别只看最高音，耐力和细节也要算。",
    },
    clips=[
        {
            "video_id": "miCknzVh9MY",
            "asset": "01-top5-eason-anticlimax",
            "fade_start": "33.2",
            "accent": COLORS["soft"],
            "header": "TOP 5 / 真假声控制",
            "song": "反高潮",
            "performer": "歌手：陈奕迅",
            "credits": "难点：真假声切换 / 轻重气息 / 尾段控制",
            "detail": "听着不炸，唱起来很容易失去支撑。",
            "source": "CatLikeMusic / DUO live upload",
        },
        {
            "video_id": "ncG579yBflc",
            "asset": "02-top4-eason-black-night",
            "fade_start": "33.2",
            "accent": COLORS["support"],
            "header": "TOP 4 / 低沉到开阔",
            "song": "黑夜不再来",
            "performer": "歌手：陈奕迅",
            "credits": "难点：音域跨度 / 歌剧感 / 咬字味道",
            "detail": "低音要沉，高音要开，还不能丢戏剧感。",
            "source": "Eason Chan / Official live",
        },
        {
            "video_id": "s2LzcNvAPF0",
            "asset": "03-top3-eason-naked",
            "fade_start": "33.2",
            "accent": COLORS["highlight"],
            "header": "TOP 3 / 长句气息",
            "song": "一丝不挂",
            "performer": "歌手：陈奕迅",
            "credits": "难点：长句支撑 / 咬字清晰 / 情绪续航",
            "detail": "一口气撑不住，后面就会直接断电。",
            "source": "Eason Chan / Official live",
        },
        {
            "video_id": "7H2FPD7Z3rE",
            "asset": "04-top2-eason-times-wheel",
            "fade_start": "33.2",
            "accent": COLORS["signal"],
            "header": "TOP 2 / 节奏和气息",
            "song": "时代巨轮",
            "performer": "歌手：陈奕迅",
            "credits": "难点：密集节奏 / 长线气息 / 强弱变化",
            "detail": "不是单纯飙高，是一路被节奏推着跑。",
            "source": "music corner / Live upload",
        },
        {
            "video_id": "KgQx3Ob8l8A",
            "asset": "05-top1-eason-exaggerated",
            "fade_start": "33.2",
            "accent": COLORS["surface"],
            "header": "TOP 1 / 爆发疯感",
            "song": "浮夸",
            "performer": "歌手：陈奕迅",
            "credits": "难点：高音爆发 / 真假声转换 / 戏剧张力",
            "detail": "最后不只要唱上去，还要唱出失控边缘。",
            "source": "Eason Chan / Official live",
        },
    ],
    contact_stamps=[2, 20, 54, 88, 122, 156, 178],
)

