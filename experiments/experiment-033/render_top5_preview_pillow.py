#!/usr/bin/env python3
from __future__ import annotations

import sys
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT_DIR / "scripts/video"))

from pillow_top5_renderer import COLORS, render_top5_video  # noqa: E402


render_top5_video(
    experiment_id="experiment-033",
    output_slug="sun-nan-top5-vocal-difficulty",
    intro={
        "eyebrow": "SUN NAN VOCAL DIFFICULTY / TOP 5",
        "title_a": "孙楠最难的歌",
        "title_b": "TOP5",
        "subtitle": "真正难的不是喊上去，是顶住还好听。",
        "note": "高音、气息、声压，每一首都很考验。",
    },
    closing={
        "eyebrow": "NEXT TOPIC?",
        "title_a": "哪首最难顶？",
        "title_b": "",
        "subtitle": "孙楠的歌，难在高音有力量也有厚度。",
        "note": "下一期继续拆华语男声高难现场。",
    },
    clips=[
        {
            "video_id": "k9x4Ax-fz4A",
            "asset": "01-top5-sun-bu-jian-bu-san",
            "fade_start": "33.2",
            "accent": COLORS["soft"],
            "header": "TOP 5 / KTV紧绷点",
            "song": "不见不散",
            "performer": "歌手：孙楠",
            "credits": "难点：高位咬字 / 气息稳定 / 副歌支撑",
            "detail": "旋律顺不等于好唱，越到后面越容易紧。",
            "source": "EVERGRANDE MUSIC / HD",
        },
        {
            "video_id": "4T-HSAZMPXg",
            "asset": "02-top4-sun-feng-wang-bei-chui",
            "fade_start": "33.2",
            "accent": COLORS["support"],
            "header": "TOP 4 / 厚度上推",
            "song": "风往北吹",
            "performer": "歌手：孙楠",
            "credits": "难点：主歌稳定 / 副歌打开 / 力量厚度",
            "detail": "高音要到位，还要有情绪和重量。",
            "source": "NS Music Channel / Lyric Video",
        },
        {
            "video_id": "SkwKiJPtJxk",
            "asset": "03-top3-sun-ni-kuai-hui-lai",
            "fade_start": "33.2",
            "accent": COLORS["highlight"],
            "header": "TOP 3 / 呼喊穿透",
            "song": "你快回来",
            "performer": "歌手：孙楠",
            "credits": "难点：高位持续 / 气息强撑 / 穿透力",
            "detail": "声音一虚，那种呼喊感就立不住。",
            "source": "EVERGRANDE MUSIC / HD",
        },
        {
            "video_id": "iZjVegLNEA0",
            "asset": "04-top2-sun-ran-shao",
            "fade_start": "33.2",
            "accent": COLORS["signal"],
            "header": "TOP 2 / 瞬间飙升",
            "song": "燃烧",
            "performer": "歌手：孙楠",
            "credits": "难点：音域跨度 / 真假声转换 / 高音爆发",
            "detail": "听着像燃起来，唱的人更像被点着。",
            "source": "Sun Nan / Topic Audio",
        },
        {
            "video_id": "GfviQRY-UU0",
            "asset": "05-top1-sun-zheng-jiu",
            "fade_start": "33.2",
            "accent": COLORS["surface"],
            "header": "TOP 1 / 声压硬顶",
            "song": "拯救",
            "performer": "歌手：孙楠",
            "credits": "难点：亮硬高音 / 持续声压 / 后段续航",
            "detail": "这段顶不住，很容易从拯救唱成求救。",
            "source": "Sun Nan / Topic Audio",
        },
    ],
    contact_stamps=[2, 20, 54, 88, 122, 156, 178],
)
