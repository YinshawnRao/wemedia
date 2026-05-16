#!/usr/bin/env python3
from __future__ import annotations

import sys
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT_DIR / "scripts/video"))

from pillow_top5_renderer import COLORS, render_top5_video  # noqa: E402


render_top5_video(
    experiment_id="experiment-035",
    output_slug="jolin-top5-vocal-difficulty-base",
    intro={
        "eyebrow": "JOLIN TSAI VOCAL DIFFICULTY / TOP 5",
        "title_a": "蔡依林最难的歌",
        "title_b": "TOP5",
        "subtitle": "唱跳、咬字、气息和态度，全都要同时在线。",
        "note": "片头之后，直接听最难段落。",
    },
    closing={
        "eyebrow": "NEXT TOPIC?",
        "title_a": "哪首最难稳住？",
        "title_b": "",
        "subtitle": "蔡依林的难，不只在高音，更在边动边准。",
        "note": "下一期继续拆华语唱跳名场面。",
    },
    clips=[
        {
            "video_id": "gG6q90HXSkw",
            "asset": "01-top5-jolin-agent-j",
            "fade_start": "33.2",
            "accent": COLORS["soft"],
            "header": "TOP 5 / 越跳越难唱",
            "song": "特务J",
            "performer": "歌手：蔡依林",
            "credits": "难点：唱跳绑定 / 咬字攻击 / 气息控制",
            "detail": "副歌要有攻击性，节奏一乱气势就散。",
            "source": "JOLIN 蔡依林 / Warner official MV",
        },
        {
            "video_id": "rOjdS33Wk5E",
            "asset": "02-top4-jolin-dao-dai",
            "fade_start": "33.2",
            "accent": COLORS["support"],
            "header": "TOP 4 / KTV陷阱歌",
            "song": "倒带",
            "performer": "歌手：蔡依林",
            "credits": "难点：高位副歌 / 情绪重量 / 真假声衔接",
            "detail": "唱轻了没痛感，唱重了又容易喊。",
            "source": "JOLIN 蔡依林 / Official audio",
        },
        {
            "video_id": "-wIHmPAvMBo",
            "asset": "03-top3-jolin-ugly-beauty",
            "fade_start": "33.2",
            "accent": COLORS["highlight"],
            "header": "TOP 3 / 怪得很费劲",
            "song": "怪美的",
            "performer": "歌手：蔡依林",
            "credits": "难点：节奏切分 / 力量推进 / 态度稳定",
            "detail": "旋律不太顺口，唱歪了就真的很累。",
            "source": "JOLIN 蔡依林 / Official MV",
        },
        {
            "video_id": "c86t8hoVw8E",
            "asset": "04-top2-jolin-play",
            "fade_start": "33.2",
            "accent": COLORS["signal"],
            "header": "TOP 2 / 嘴和肺上班",
            "song": "Play 我呸",
            "performer": "歌手：蔡依林",
            "credits": "难点：密集咬字 / 碎拍节奏 / 舞曲律动",
            "detail": "Rap感和态度都要卡准，慢半拍就掉味。",
            "source": "JOLIN 蔡依林 / Warner official HD MV",
        },
        {
            "video_id": "0EN3MnGEBXk",
            "asset": "05-top1-jolin-dancing-diva",
            "fade_start": "33.2",
            "accent": COLORS["surface"],
            "header": "TOP 1 / 唱跳天花板",
            "song": "舞娘",
            "performer": "歌手：蔡依林",
            "credits": "难点：节奏气息 / 肢体控制 / 异域律动",
            "detail": "边跳边唱还要稳，普通人光扭都喘。",
            "source": "JOLIN 蔡依林 / Warner official MV",
        },
    ],
    contact_stamps=[2, 20, 54, 88, 122, 156, 178],
)

