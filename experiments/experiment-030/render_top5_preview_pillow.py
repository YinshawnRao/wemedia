#!/usr/bin/env python3
from __future__ import annotations

import sys
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT_DIR / "scripts/video"))

from pillow_top5_renderer import COLORS, render_top5_video  # noqa: E402


render_top5_video(
    experiment_id="experiment-030",
    output_slug="faye-wong-top5-vocal-difficulty",
    intro={
        "eyebrow": "FAYE VOCAL DIFFICULTY / TOP 5",
        "title_a": "王菲最难的歌",
        "title_b": "TOP5",
        "subtitle": "听着轻，唱着全是控制。",
        "note": "难的不是喊上去，是每个气口都悬住。",
    },
    closing={
        "eyebrow": "NEXT TOPIC?",
        "title_a": "哪首最难模仿？",
        "title_b": "",
        "subtitle": "王菲的难，是轻到像没用力。",
        "note": "下一期继续拆女声控制型难歌。",
    },
    clips=[
        {
            "video_id": "MUC6DZTZL4k",
            "asset": "01-top5-faye-new-tenant",
            "fade_start": "33.2",
            "accent": COLORS["soft"],
            "header": "TOP 5 / 虚实音色",
            "song": "新房客",
            "performer": "歌手：王菲",
            "credits": "难点：游离节奏 / 虚实切换 / 音准悬浮",
            "detail": "气息可以飘，音准不能跟着飘。",
            "source": "FayeWongVEVO / Official MV",
        },
        {
            "video_id": "upkaTcir1m8",
            "asset": "02-top4-faye-solitude",
            "fade_start": "33.2",
            "accent": COLORS["support"],
            "header": "TOP 4 / 空灵控制",
            "song": "百年孤寂",
            "performer": "歌手：王菲",
            "credits": "难点：真假声边缘 / 气声质感 / 轻重分寸",
            "detail": "唱重了会俗，唱轻了又容易虚。",
            "source": "FayeWongVEVO / Official MV",
        },
        {
            "video_id": "8rnnsxbKBNw",
            "asset": "03-top3-faye-last-blossom",
            "fade_start": "33.2",
            "accent": COLORS["highlight"],
            "header": "TOP 3 / 怪律动爆发",
            "song": "开到荼蘼",
            "performer": "歌手：王菲",
            "credits": "难点：密集咬字 / 怪律动 / 高音爆发",
            "detail": "情绪要疯，但声音不能喊散。",
            "source": "FayeWongVEVO / Official MV",
        },
        {
            "video_id": "pTy91LJGV7A",
            "asset": "04-top2-faye-restless",
            "fade_start": "33.2",
            "accent": COLORS["signal"],
            "header": "TOP 2 / 实验吟唱",
            "song": "浮躁",
            "performer": "歌手：王菲",
            "credits": "难点：实验旋律 / 吟唱音准 / 节奏游走",
            "detail": "旋律不按常规走，精神状态还得稳。",
            "source": "FayeWongVEVO / Live 1998",
        },
        {
            "video_id": "TxJIi_NOR54",
            "asset": "05-top1-faye-halfway",
            "fade_start": "33.2",
            "accent": COLORS["surface"],
            "header": "TOP 1 / 快歌换声",
            "song": "半途而废",
            "performer": "歌手：王菲",
            "credits": "难点：真假声切换 / 快速咬字 / 气息稳定",
            "detail": "速度一起来，音准和气口都不能掉。",
            "source": "Faye Wong Official Channel / Official audio",
        },
    ],
    contact_stamps=[2, 20, 54, 88, 122, 156, 178],
)

