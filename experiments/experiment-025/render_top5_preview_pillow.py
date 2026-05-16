#!/usr/bin/env python3
from __future__ import annotations

import sys
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT_DIR / "scripts/video"))

from pillow_top5_renderer import COLORS, render_top5_video  # noqa: E402


render_top5_video(
    experiment_id="experiment-025",
    output_slug="tank-songs-for-others-top5",
    intro={
        "eyebrow": "TANK / SONGS FOR OTHERS TOP 5",
        "title_a": "Tank吕建忠为别人创作的",
        "title_b": "歌TOP5",
        "subtitle": "台偶、古偶、青春团体和 R&B 情歌的回忆线。",
        "note": "这些副歌，都是一秒回到偶像剧年代。",
    },
    closing={
        "eyebrow": "TANK / TOP 5",
        "title_a": "Tank写给别人的歌",
        "title_b": "也是台偶黄金时代的声纹",
        "subtitle": "旋律很直接，情绪也很会命中记忆点。",
        "note": "哪一首最有青春滤镜？",
    },
    clips=[
        {
            "video_id": "nPtEgaLXPHs",
            "asset": "01-top5-after-sunrise",
            "fade_start": "68.2",
            "accent": COLORS["soft"],
            "header": "TOP 5 / 古偶深情补刀",
            "song": "天亮以后",
            "performer": "演唱：胡歌",
            "credits": "作词：Tank / 作曲：Tank",
            "detail": "天外飞仙一开口，古早深情感就回来了。",
            "source": "華研國際 / Official MV",
        },
        {
            "video_id": "9Qm8TYJynlc",
            "asset": "02-top4-summer-snow",
            "fade_start": "59.2",
            "accent": COLORS["support"],
            "header": "TOP 4 / 少年苦甜副歌",
            "song": "夏雪",
            "performer": "演唱：飞轮海",
            "credits": "作词：陈信延 / 作曲：Tank",
            "detail": "少年感、偶像剧感、苦甜感全在副歌里。",
            "source": "華研國際 / Official MV",
        },
        {
            "video_id": "Gf0gsx_qbj8",
            "asset": "03-top3-young",
            "fade_start": "58.2",
            "accent": COLORS["highlight"],
            "header": "TOP 3 / 台偶团体名片",
            "song": "我有我的Young",
            "performer": "演唱：飞轮海",
            "credits": "作词：陈信延 / 作曲：Tank",
            "detail": "广告感和团体感拉满，一秒回到出道期。",
            "source": "華研國際 / Official MV",
        },
        {
            "video_id": "YbF-neBEUrc",
            "asset": "04-top2-not-friend",
            "fade_start": "64.2",
            "accent": COLORS["signal"],
            "header": "TOP 2 / 朋友以上恋人未满",
            "song": "不作你的朋友",
            "performer": "演唱：S.H.E",
            "credits": "作词：葛大为 / 作曲：Tank",
            "detail": "抒情R&B的分寸感，卡在暧昧和遗憾中间。",
            "source": "華研國際 / Official MV",
        },
        {
            "video_id": "jRFpeNY1k-Q",
            "asset": "05-top1-it-had-to-be-you",
            "fade_start": "69.2",
            "accent": COLORS["surface"],
            "header": "TOP 1 / 青春OST滤镜",
            "song": "非你莫属",
            "performer": "演唱：林依晨",
            "credits": "作词：陈信延 / 作曲：Tank",
            "detail": "副歌一响，就是东方茱丽叶的青春回忆。",
            "source": "華研國際 / Official MV",
        },
    ],
    contact_stamps=[2, 30, 92, 154, 218, 286, 332],
)
