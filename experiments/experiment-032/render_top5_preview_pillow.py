#!/usr/bin/env python3
from __future__ import annotations

import sys
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT_DIR / "scripts/video"))

from pillow_top5_renderer import COLORS, render_top5_video  # noqa: E402


render_top5_video(
    experiment_id="experiment-032",
    output_slug="fish-leong-top5-vocal-difficulty",
    intro={
        "eyebrow": "FISH LEONG VOCAL DIFFICULTY / TOP 5",
        "title_a": "梁静茹最难的歌",
        "title_b": "TOP5",
        "subtitle": "温柔不是省力，是每一句都要稳。",
        "note": "清透、气息、真假声，越细越难藏。",
    },
    closing={
        "eyebrow": "NEXT TOPIC?",
        "title_a": "哪首最难稳？",
        "title_b": "",
        "subtitle": "梁静茹的难，是轻里有支撑。",
        "note": "下一期继续拆华语女声隐藏难歌。",
    },
    clips=[
        {
            "video_id": "XPD-0b66Wv4",
            "asset": "01-top5-fish-unconditionally-for-you",
            "fade_start": "33.2",
            "accent": COLORS["soft"],
            "header": "TOP 5 / 清透高位",
            "song": "无条件为你",
            "performer": "歌手：梁静茹",
            "credits": "难点：明亮高音 / 甜度控制 / 连续气息",
            "detail": "唱轻了没力量，唱重了就失去清透感。",
            "source": "Rock Records / Official MV",
        },
        {
            "video_id": "itjyryJ-8IU",
            "asset": "02-top4-fish-love-song",
            "fade_start": "33.2",
            "accent": COLORS["support"],
            "header": "TOP 4 / KTV陷阱",
            "song": "情歌",
            "performer": "歌手：梁静茹",
            "credits": "难点：音准细节 / 气息线条 / 真假声衔接",
            "detail": "听着温柔，真正唱稳每一句很难。",
            "source": "Fish Leong / Official Audio",
        },
        {
            "video_id": "TUXD13PSebw",
            "asset": "03-top3-fish-worship",
            "fade_start": "33.2",
            "accent": COLORS["highlight"],
            "header": "TOP 3 / 情绪层次",
            "song": "崇拜",
            "performer": "歌手：梁静茹",
            "credits": "难点：跨度控制 / 弱起推进 / 爆发收尾",
            "detail": "前面要压得住，后面还要推得开。",
            "source": "Fish Leong / Official Audio",
        },
        {
            "video_id": "LwaZVMERWdQ",
            "asset": "04-top2-fish-silkroad",
            "fade_start": "33.2",
            "accent": COLORS["signal"],
            "header": "TOP 2 / 大歌格局",
            "song": "丝路",
            "performer": "歌手：梁静茹",
            "credits": "难点：主歌细腻 / 副歌打开 / 情绪推进",
            "detail": "气息一空，整首歌的画面感就塌了。",
            "source": "Rock Records / Official MV",
        },
        {
            "video_id": "KAn2ejVJlE0",
            "asset": "05-top1-fish-wings-of-love",
            "fade_start": "33.2",
            "accent": COLORS["surface"],
            "header": "TOP 1 / 高位爆发",
            "song": "燕尾蝶",
            "performer": "歌手：梁静茹",
            "credits": "难点：连续高位 / 气口紧 / 穿透稳定",
            "detail": "副歌一路顶上去，爆发和稳定都要撑住。",
            "source": "Rock Records / Official MV",
        },
    ],
    contact_stamps=[2, 20, 54, 88, 122, 156, 178],
)
