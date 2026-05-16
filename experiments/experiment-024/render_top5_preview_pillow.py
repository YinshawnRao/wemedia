#!/usr/bin/env python3
from __future__ import annotations

import subprocess
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont


ROOT_DIR = Path(__file__).resolve().parents[2]
RAW_DIR = ROOT_DIR / "sandbox/yt-dlp/clips/experiment-024"
PROJECT_DIR = ROOT_DIR / "sandbox/hyperframes/experiment-024"
ASSET_DIR = PROJECT_DIR / "assets"
OUT_DIR = ROOT_DIR / "sandbox/exports/experiment-024"
WORK_DIR = OUT_DIR / "ffmpeg_jj_lin_others_work"
OVERLAY_DIR = WORK_DIR / "overlays"
SEGMENT_DIR = WORK_DIR / "segments"
FINAL_OUT = OUT_DIR / "jj-lin-songs-for-others-top5-preview.mp4"
CONTACT_SHEET = OUT_DIR / "jj-lin-songs-for-others-top5-contact-sheet.jpg"

W, H = 1080, 1920
COLORS = {
    "bg": "#0e1116",
    "surface": "#f7f2e8",
    "text": "#f8fafc",
    "signal": "#e94b35",
    "support": "#2bb3a3",
    "highlight": "#f2c14e",
    "soft": "#9ccfd8",
}


def run(args: list[str | Path]) -> None:
    subprocess.run([str(arg) for arg in args], check=True)


def font(size: int, *, medium: bool = True) -> ImageFont.FreeTypeFont:
    candidates = [
        "/System/Library/Fonts/STHeiti Medium.ttc" if medium else "/System/Library/Fonts/STHeiti Light.ttc",
        "/System/Library/Fonts/Hiragino Sans GB.ttc",
        "/System/Library/Fonts/SFNS.ttf",
        "/System/Library/Fonts/Helvetica.ttc",
    ]
    for path in candidates:
        try:
            return ImageFont.truetype(path, size=size)
        except OSError:
            continue
    return ImageFont.load_default()


def rect(draw: ImageDraw.ImageDraw, box: tuple[int, int, int, int], fill: str, alpha: int = 255) -> None:
    r, g, b = Image.new("RGB", (1, 1), fill).getpixel((0, 0))
    draw.rectangle(box, fill=(r, g, b, alpha))


def text(
    draw: ImageDraw.ImageDraw,
    xy: tuple[int, int],
    value: str,
    *,
    size: int,
    fill: str,
    medium: bool = True,
    shadow: bool = True,
) -> None:
    fnt = font(size, medium=medium)
    if shadow:
        draw.text((xy[0] + 3, xy[1] + 3), value, font=fnt, fill=(0, 0, 0, 150))
    draw.text(xy, value, font=fnt, fill=fill)


def ensure_dirs() -> None:
    for path in (ASSET_DIR, OVERLAY_DIR, SEGMENT_DIR, OUT_DIR):
        path.mkdir(parents=True, exist_ok=True)


def find_clip(video_id: str) -> Path:
    matches = sorted(RAW_DIR.glob(f"*{video_id}*.mp4"))
    if not matches:
        raise FileNotFoundError(f"Missing source for {video_id}")
    return matches[0]


def process_asset(video_id: str, out_name: str, fade_start: str) -> None:
    src = find_clip(video_id)
    out = ASSET_DIR / f"{out_name}.mp4"
    vf = (
        "split=2[bg][fg];"
        "[bg]scale=1080:1920:force_original_aspect_ratio=increase,"
        "crop=1080:1920,gblur=sigma=34,eq=brightness=-0.13:saturation=0.88[bg];"
        "[fg]scale=1080:1920:force_original_aspect_ratio=decrease[fg];"
        "[bg][fg]overlay=(W-w)/2:(H-h)/2,format=yuv420p"
    )
    af = f"loudnorm=I=-16:TP=-1.5:LRA=11,afade=t=in:st=0:d=0.2,afade=t=out:st={fade_start}:d=0.55"
    run(
        [
            "ffmpeg",
            "-v",
            "error",
            "-y",
            "-i",
            src,
            "-vf",
            vf,
            "-r",
            "30",
            "-c:v",
            "libx264",
            "-preset",
            "veryfast",
            "-crf",
            "22",
            "-g",
            "60",
            "-keyint_min",
            "60",
            "-sc_threshold",
            "0",
            "-af",
            af,
            "-ac",
            "2",
            "-ar",
            "48000",
            "-c:a",
            "aac",
            "-b:a",
            "160k",
            "-movflags",
            "+faststart",
            out,
        ]
    )


def make_title_overlay(file: str, eyebrow: str, title_a: str, title_b: str, subtitle: str, note: str) -> None:
    img = Image.new("RGBA", (W, H), COLORS["bg"])
    draw = ImageDraw.Draw(img, "RGBA")
    rect(draw, (0, 0, W, 24), COLORS["signal"])
    rect(draw, (0, 24, W, 40), COLORS["support"])
    rect(draw, (72, 548, 84, 1036), COLORS["highlight"])
    text(draw, (72, 178), eyebrow, size=34, fill=COLORS["support"])
    text(draw, (112, 645), title_a, size=84, fill=COLORS["text"])
    text(draw, (112, 767), title_b, size=84, fill=COLORS["highlight"])
    text(draw, (72, 1596), subtitle, size=34, fill=COLORS["surface"])
    text(draw, (72, 1668), note, size=24, fill=COLORS["soft"])
    img.save(OVERLAY_DIR / f"{file}.png")


def make_rank_overlay(
    file: str,
    accent: str,
    header: str,
    song: str,
    performer: str,
    credits: str,
    detail: str,
    source: str,
) -> None:
    img = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img, "RGBA")
    rect(draw, (54, 76, 774, 152), COLORS["bg"], 200)
    text(draw, (78, 94), header, size=34, fill=accent)
    rect(draw, (54, 1212, 1026, 1660), COLORS["bg"], 210)
    rect(draw, (54, 1212, 62, 1660), accent)
    text(draw, (88, 1268), song, size=58, fill=COLORS["text"])
    text(draw, (88, 1364), performer, size=34, fill=accent)
    text(draw, (88, 1456), credits, size=27, fill=COLORS["surface"])
    text(draw, (88, 1526), detail, size=27, fill=COLORS["soft"])
    rect(draw, (54, 1772, 1026, 1836), COLORS["bg"], 174)
    rect(draw, (78, 1801, 196, 1806), accent)
    text(draw, (218, 1786), source, size=21, fill=COLORS["surface"])
    img.save(OVERLAY_DIR / f"{file}.png")


def render_overlay_segment(input_video: Path, overlay_name: str, output: Path) -> None:
    run(
        [
            "ffmpeg",
            "-v",
            "error",
            "-y",
            "-i",
            input_video,
            "-i",
            OVERLAY_DIR / f"{overlay_name}.png",
            "-filter_complex",
            "[0:v][1:v]overlay=0:0:format=auto,format=yuv420p[v]",
            "-map",
            "[v]",
            "-map",
            "0:a?",
            "-r",
            "30",
            "-c:v",
            "libx264",
            "-preset",
            "veryfast",
            "-crf",
            "22",
            "-g",
            "60",
            "-keyint_min",
            "60",
            "-sc_threshold",
            "0",
            "-c:a",
            "copy",
            "-movflags",
            "+faststart",
            output,
        ]
    )


def render_title_segment(overlay_name: str, duration: str, output: Path) -> None:
    run(
        [
            "ffmpeg",
            "-v",
            "error",
            "-y",
            "-loop",
            "1",
            "-t",
            duration,
            "-i",
            OVERLAY_DIR / f"{overlay_name}.png",
            "-f",
            "lavfi",
            "-t",
            duration,
            "-i",
            "anullsrc=channel_layout=stereo:sample_rate=48000",
            "-map",
            "0:v",
            "-map",
            "1:a",
            "-r",
            "30",
            "-c:v",
            "libx264",
            "-preset",
            "veryfast",
            "-crf",
            "22",
            "-g",
            "60",
            "-keyint_min",
            "60",
            "-sc_threshold",
            "0",
            "-pix_fmt",
            "yuv420p",
            "-c:a",
            "aac",
            "-b:a",
            "160k",
            "-ar",
            "48000",
            "-ac",
            "2",
            "-shortest",
            "-movflags",
            "+faststart",
            output,
        ]
    )


def concat_segments(files: list[Path]) -> None:
    concat = WORK_DIR / "concat.txt"
    concat.write_text("".join(f"file '{path}'\n" for path in files), encoding="utf-8")
    run(["ffmpeg", "-v", "error", "-y", "-f", "concat", "-safe", "0", "-i", concat, "-c", "copy", "-movflags", "+faststart", FINAL_OUT])


def make_contact_sheet() -> None:
    frames_dir = OUT_DIR / "contact_frames"
    frames_dir.mkdir(parents=True, exist_ok=True)
    for idx, stamp in enumerate([2, 24, 78, 132, 185, 246, 302]):
        run(["ffmpeg", "-v", "error", "-y", "-ss", str(stamp), "-i", FINAL_OUT, "-frames:v", "1", frames_dir / f"frame_{idx:02d}.png"])
    run(
        [
            "ffmpeg",
            "-v",
            "error",
            "-y",
            "-pattern_type",
            "glob",
            "-i",
            frames_dir / "frame_*.png",
            "-vf",
            "scale=180:-2,tile=7x1,format=yuvj420p",
            "-q:v",
            "3",
            CONTACT_SHEET,
        ]
    )


def main() -> None:
    ensure_dirs()

    process_asset("oDoRF0vohvE", "01-top5-smiling-eyes", "41.2")
    process_asset("IhUGIZjOwWs", "02-top4-yi-yan-wan-nian", "69.2")
    process_asset("VhCRokYVF1I", "03-top3-heart-wall", "55.2")
    process_asset("Es2b6sM2nrs", "04-top2-dang-ni", "43.2")
    process_asset("qm3wIQWnXxg", "05-top1-remember", "79.2")

    make_title_overlay(
        "00-intro",
        "JJ LIN / SONGS FOR OTHERS TOP 5",
        "林俊杰为别人创作的",
        "歌TOP5",
        "甜心情歌、青春 OST、仙侠滤镜和经典翻唱记忆。",
        "这些副歌，后来都长成了时代旋律。",
    )
    render_title_segment("00-intro", "5.0", SEGMENT_DIR / "00-intro.mp4")

    make_rank_overlay(
        "01-top5-smiling-eyes",
        COLORS["soft"],
        "TOP 5 / 温柔二次翻红",
        "爱笑的眼睛",
        "演唱：徐若瑄",
        "作词：洪瑞业 / 作曲：林俊杰",
        "原唱温柔，作者翻唱又扩大一轮传播。",
        "愛貝克思 avex taiwan / Official MV",
    )
    render_overlay_segment(ASSET_DIR / "01-top5-smiling-eyes.mp4", "01-top5-smiling-eyes", SEGMENT_DIR / "01-top5-smiling-eyes.mp4")

    make_rank_overlay(
        "02-top4-yi-yan-wan-nian",
        COLORS["support"],
        "TOP 4 / 仙侠OST记忆",
        "一眼万年",
        "演唱：S.H.E",
        "作词：姚若龙 / 作曲：林俊杰",
        "古装滤镜一开，旋律大气又深情。",
        "華研國際 / Official MV",
    )
    render_overlay_segment(ASSET_DIR / "02-top4-yi-yan-wan-nian.mp4", "02-top4-yi-yan-wan-nian", SEGMENT_DIR / "02-top4-yi-yan-wan-nian.mp4")

    make_rank_overlay(
        "03-top3-heart-wall",
        COLORS["highlight"],
        "TOP 3 / 青春清亮副歌",
        "心墙",
        "演唱：郭静",
        "作词：姚若龙 / 作曲：林俊杰",
        "你的心有一道墙，但副歌一直有一扇窗。",
        "福茂唱片 / Official MV",
    )
    render_overlay_segment(ASSET_DIR / "03-top3-heart-wall.mp4", "03-top3-heart-wall", SEGMENT_DIR / "03-top3-heart-wall.mp4")

    make_rank_overlay(
        "04-top2-dang-ni",
        COLORS["signal"],
        "TOP 2 / 甜心青春开关",
        "当你",
        "演唱：王心凌",
        "作词：张思尔 / 作曲：林俊杰",
        "一句眼睛眯着笑，就是青春开关。",
        "愛貝克思 avex taiwan / Official MV",
    )
    render_overlay_segment(ASSET_DIR / "04-top2-dang-ni.mp4", "04-top2-dang-ni", SEGMENT_DIR / "04-top2-dang-ni.mp4")

    make_rank_overlay(
        "05-top1-remember",
        COLORS["surface"],
        "TOP 1 / 双版本都能打",
        "记得",
        "演唱：张惠妹",
        "作词：易家扬 / 作曲：林俊杰",
        "阿妹唱成经典，林俊杰再唱也出圈。",
        "Timeless Music / Official MV",
    )
    render_overlay_segment(ASSET_DIR / "05-top1-remember.mp4", "05-top1-remember", SEGMENT_DIR / "05-top1-remember.mp4")

    make_title_overlay(
        "99-closing",
        "JJ LIN / TOP 5",
        "林俊杰写给别人的歌",
        "也很像他的青春底色",
        "旋律简单、情绪直接，副歌一到就会被记住。",
        "哪一首最像你的回忆开关？",
    )
    render_title_segment("99-closing", "5.0", SEGMENT_DIR / "99-closing.mp4")

    concat_segments(
        [
            SEGMENT_DIR / "00-intro.mp4",
            SEGMENT_DIR / "01-top5-smiling-eyes.mp4",
            SEGMENT_DIR / "02-top4-yi-yan-wan-nian.mp4",
            SEGMENT_DIR / "03-top3-heart-wall.mp4",
            SEGMENT_DIR / "04-top2-dang-ni.mp4",
            SEGMENT_DIR / "05-top1-remember.mp4",
            SEGMENT_DIR / "99-closing.mp4",
        ]
    )
    make_contact_sheet()
    print(FINAL_OUT)


if __name__ == "__main__":
    main()
