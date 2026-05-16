#!/usr/bin/env python3
from __future__ import annotations

import sys
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT_DIR / "scripts/video"))

from pillow_top5_renderer import COLORS, render_top5_video  # noqa: E402


render_top5_video(
    experiment_id="experiment-028",
    output_slug="mandopop-live-oops-top5",
    intro={
        "eyebrow": "LIVE MOMENTS / LIGHT TOP 5",
        "title_a": "华语live翻车名场面",
        "title_b": "TOP5",
        "subtitle": "有些现场，歌手本人可能也想重来一次",
        "note": "轻松复盘，不开恶意。",
    },
    closing={
        "eyebrow": "NEXT TOPIC?",
        "title_a": "哪段最有记忆点？",
        "title_b": "",
        "subtitle": "真实 Live 的魅力，就是永远无法重录。",
        "note": "下一期继续考古华语现场名场面。",
    },
    clips=[
        {
            "video_id": "ThR4kOGHYpI",
            "asset": "01-top5-coco-didadi",
            "fade_start": "31.2",
            "accent": COLORS["soft"],
            "header": "TOP 5 / 救场变互动梗",
            "song": "Di Da Di",
            "performer": "歌手：李玟",
            "credits": "现场：《声生不息》相关片段 / 名场面回应",
            "detail": "小意外被她接成互动，舞台反应真的快。",
            "source": "CoCoLeeShow / Clip",
        },
        {
            "video_id": "HW35TnjoFZk",
            "asset": "02-top4-penny-tai-fan",
            "fade_start": "31.2",
            "accent": COLORS["support"],
            "header": "TOP 4 / 互动翻车",
            "song": "怎样",
            "performer": "歌手：戴佩妮",
            "credits": "现场：演唱会递麦男粉",
            "detail": "不是歌手翻车，是互动突然拐了个弯。",
            "source": "SETN / News clip",
        },
        {
            "video_id": "HDudXh-FcVg",
            "asset": "03-top3-faye-eason",
            "fade_start": "31.2",
            "accent": COLORS["highlight"],
            "header": "TOP 3 / 梦幻同台争议点",
            "song": "因为爱情",
            "performer": "歌手：王菲、陈奕迅",
            "credits": "现场：2012央视春晚",
            "detail": "梦幻同台，也留下多年讨论的现场记忆。",
            "source": "CCTV春晚 / Official",
        },
        {
            "video_id": "Z5uhPP15gTk",
            "asset": "04-top2-sa-dingding-mic",
            "fade_start": "31.2",
            "accent": COLORS["signal"],
            "header": "TOP 2 / 话筒乌龙",
            "song": "大名顶顶",
            "performer": "歌手：萨顶顶",
            "credits": "现场：2016央视元宵晚会相关报道",
            "detail": "画面一秒懂，舞台意外的辨识度太强。",
            "source": "SMG上海电视台 / News clip",
        },
        {
            "video_id": "f5x5wUapGHk",
            "asset": "05-top1-fahrenheit-young",
            "fade_start": "31.2",
            "accent": COLORS["surface"],
            "header": "TOP 1 / 真唱考古",
            "song": "我有我的YOUNG",
            "performer": "组合：飞轮海",
            "credits": "现场：2006 HitFM 现场片段",
            "detail": "唱跳、气息、音准一起上强度，青春滤镜也一起上来。",
            "source": "19920218nora / Live upload",
        },
    ],
    contact_stamps=[2, 18, 50, 82, 114, 146, 170],
)
