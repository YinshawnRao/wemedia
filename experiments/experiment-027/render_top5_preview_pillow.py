#!/usr/bin/env python3
from __future__ import annotations

import sys
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT_DIR / "scripts/video"))

from pillow_top5_renderer import COLORS, render_top5_video  # noqa: E402


render_top5_video(
    experiment_id="experiment-027",
    output_slug="haikuotiankong-covers-top5",
    intro={
        "eyebrow": "CLASSIC COVERS / LIVE TOP 5",
        "title_a": "《海阔天空》神级翻唱",
        "title_b": "TOP5",
        "subtitle": "同一首经典，谁唱出了你的青春？",
        "note": "同歌不同味道，都是情怀现场。",
    },
    closing={
        "eyebrow": "NEXT TOPIC?",
        "title_a": "哪版最戳你？",
        "title_b": "",
        "subtitle": "同一首歌，听见五种人生气质。",
        "note": "下一期继续盘华语经典现场。",
    },
    clips=[
        {
            "video_id": "denQIeRAhmo",
            "asset": "01-top5-infinity-and-beyond-chorus",
            "fade_start": "31.2",
            "accent": COLORS["soft"],
            "header": "TOP 5 / 全场大合唱",
            "song": "《海阔天空》",
            "performer": "演唱者：声生不息群星",
            "credits": "原唱：Beyond / 作词：黄家驹 / 作曲：黄家驹",
            "detail": "全场一起唱，港乐记忆一下被点亮。",
            "source": "MangoTV / Live",
        },
        {
            "video_id": "_iJqSr2arZ0",
            "asset": "02-top4-shin",
            "fade_start": "31.2",
            "accent": COLORS["support"],
            "header": "TOP 4 / 摇滚高音",
            "song": "《海阔天空》",
            "performer": "演唱者：信 / 苏见信",
            "credits": "原唱：Beyond / 作词：黄家驹 / 作曲：黄家驹",
            "detail": "摇滚高音冲开副歌，热血感很足。",
            "source": "ZJSTV Music / Live",
        },
        {
            "video_id": "OfIFA-V6Zec",
            "asset": "03-top3-gem",
            "fade_start": "31.2",
            "accent": COLORS["highlight"],
            "header": "TOP 3 / 高爆发现场",
            "song": "《海阔天空》",
            "performer": "演唱者：邓紫棋",
            "credits": "原唱：Beyond / 作词：黄家驹 / 作曲：黄家驹",
            "detail": "年轻一代的爆发力，把情绪一路推高。",
            "source": "GEM鄧紫棋 / Official Live",
        },
        {
            "video_id": "YXTf5wVacfg",
            "asset": "04-top2-sandy-lam",
            "fade_start": "31.2",
            "accent": COLORS["signal"],
            "header": "TOP 2 / 温柔倔强",
            "song": "《海阔天空》",
            "performer": "演唱者：林忆莲",
            "credits": "原唱：Beyond / 作词：黄家驹 / 作曲：黄家驹",
            "detail": "温柔但不软，女声版本里的细腻倔强。",
            "source": "Vincent Chang / Live upload",
        },
        {
            "video_id": "n5wgWGy_qUA",
            "asset": "05-top1-george-lam",
            "fade_start": "31.2",
            "accent": COLORS["surface"],
            "header": "TOP 1 / 港乐镇场",
            "song": "《海阔天空》",
            "performer": "演唱者：林子祥",
            "credits": "原唱：Beyond / 作词：黄家驹 / 作曲：黄家驹",
            "detail": "前辈级厚嗓镇场，一开口就是港乐气势。",
            "source": "甄想天地 / Live upload",
        },
    ],
    contact_stamps=[2, 18, 50, 82, 114, 146, 170],
)
