#!/usr/bin/env python3
from __future__ import annotations

import sys
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT_DIR / "scripts/video"))

from pillow_top5_renderer import COLORS, render_top5_video  # noqa: E402


render_top5_video(
    experiment_id="experiment-026",
    output_slug="male-singers-girl-heart-top5",
    intro={
        "eyebrow": "GIRL-HEART SONGS / CONTRAST TOP 5",
        "title_a": "男歌手写少女心神曲",
        "title_b": "TOP5",
        "subtitle": "原来这些甜歌，背后都是男歌手写的？",
        "note": "反差萌一开口，回忆滤镜就亮了。",
    },
    closing={
        "eyebrow": "NEXT TOPIC?",
        "title_a": "哪首最意外？",
        "title_b": "",
        "subtitle": "硬汉男歌手写苦情女歌，还是摇滚歌手写甜歌？",
        "note": "下一期继续挖反差感幕后创作。",
    },
    clips=[
        {
            "video_id": "J5YpdUtcPgI",
            "asset": "01-top5-honey-honey-honey",
            "fade_start": "31.2",
            "accent": COLORS["soft"],
            "header": "TOP 5 / 才子恋爱泡泡",
            "song": "Honey Honey Honey",
            "performer": "原唱：萧亚轩",
            "credits": "作词：萧亚轩、王力宏 / 作曲：王力宏",
            "detail": "王力宏一出手，甜度直接变成恋爱泡泡。",
            "source": "XYELVA / Official MV",
        },
        {
            "video_id": "cOBQgUZnceg",
            "asset": "02-top4-shuo-ai-ni",
            "fade_start": "31.2",
            "accent": COLORS["support"],
            "header": "TOP 4 / 周董甜到冒泡",
            "song": "说爱你",
            "performer": "原唱：蔡依林",
            "credits": "作词：天天 / 作曲：周杰伦",
            "detail": "周杰伦写告白甜歌，轻快到完全不苦情。",
            "source": "JOLIN 蔡依林 / Official",
        },
        {
            "video_id": "Es2b6sM2nrs",
            "asset": "03-top3-dang-ni",
            "fade_start": "31.2",
            "accent": COLORS["highlight"],
            "header": "TOP 3 / JJ校园少女心",
            "song": "当你",
            "performer": "原唱：王心凌",
            "credits": "作词：张思尔 / 作曲：林俊杰",
            "detail": "原来这句青春暗恋，是早期 JJ 写的。",
            "source": "愛貝克思 avex taiwan / Official MV",
        },
        {
            "video_id": "Gw4Q7-NBFWs",
            "asset": "04-top2-wo-hui-hao-hao-de",
            "fade_start": "31.2",
            "accent": COLORS["signal"],
            "header": "TOP 2 / 伍佰写温柔失恋",
            "song": "我会好好的",
            "performer": "原唱：王心凌",
            "credits": "作词：伍佰 / 作曲：伍佰",
            "detail": "摇滚浪人写少女失恋，温柔里还是有倔强。",
            "source": "愛貝克思 avex taiwan / Official MV",
        },
        {
            "video_id": "FzKO6WZN5b4",
            "asset": "05-top1-eyelashes",
            "fade_start": "31.2",
            "accent": COLORS["surface"],
            "header": "TOP 1 / 曹格写甜心教主",
            "song": "睫毛弯弯",
            "performer": "原唱：王心凌",
            "credits": "作词：严云农 / 作曲：曹格",
            "detail": "苦情R&B男声写出眨眼小鹿乱撞，反差拉满。",
            "source": "愛貝克思 avex taiwan / Official MV",
        },
    ],
    contact_stamps=[2, 18, 50, 82, 114, 146, 170],
)
