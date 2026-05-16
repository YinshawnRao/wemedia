from __future__ import annotations

import math
import subprocess
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont


ROOT = Path(__file__).resolve().parents[1].parent
PROJECT = ROOT / "hyperframes" / "projects" / "sichuan-cuisine-hang-to-la"
AUDIO = PROJECT / "assets" / "narration.wav"
EXPORT_DIR = ROOT / "sandbox" / "exports" / "experiment-012"
VIDEO_OUT = EXPORT_DIR / "sichuan-cuisine-hang-to-la-preview.mp4"
CONTACT_OUT = EXPORT_DIR / "sichuan-cuisine-hang-to-la-contact-sheet.jpg"

W, H = 1080, 1920
FPS = 24
DURATION = 46.0

COLORS = {
    "bg": (14, 17, 22),
    "surface": (247, 242, 232),
    "text": (248, 250, 252),
    "signal": (233, 75, 53),
    "teal": (43, 179, 163),
    "yellow": (242, 193, 78),
    "grid": (8, 8, 8),
    "table": (214, 213, 207),
    "white": (255, 255, 255),
    "black": (0, 0, 0),
}

FONT_BOLD = "/System/Library/Fonts/STHeiti Medium.ttc"
FONT_LIGHT = "/System/Library/Fonts/STHeiti Light.ttc"
FONT_LATIN = "/System/Library/Fonts/SFNS.ttf"


def font(path: str, size: int) -> ImageFont.FreeTypeFont:
    return ImageFont.truetype(path, size=size)


FONTS = {
    "tag": font(FONT_LATIN, 25),
    "note": font(FONT_BOLD, 24),
    "title": font(FONT_BOLD, 122),
    "subtitle": font(FONT_BOLD, 40),
    "tier": font(FONT_BOLD, 44),
    "tier_small": font(FONT_BOLD, 34),
    "chip": font(FONT_BOLD, 31),
    "caption": font(FONT_BOLD, 58),
    "close": font(FONT_BOLD, 73),
    "close_small": font(FONT_BOLD, 44),
    "tiny": font(FONT_LIGHT, 22),
}


CAPTIONS = [
    (0, 4.5, "川菜从夯到拉，主观娱乐版。"),
    (4.5, 8, "麻婆豆腐：川菜门面，一勺下去先把米饭叫醒。"),
    (8, 11.5, "水煮牛肉：看着猛，香麻烫才是核心杀伤。"),
    (11.5, 15, "回锅肉：锅气一出来，顶级下饭机器。"),
    (15, 18.5, "辣子鸡：找鸡像考古，越翻越上头。"),
    (18.5, 22, "鱼香肉丝：没鱼但有魂，糖醋咸辣得卡得准。"),
    (22, 25.5, "夫妻肺片：红油冷菜天花板，懂的人先夹一筷。"),
    (25.5, 29, "口水鸡：名字像玩笑，红油是正经功夫。"),
    (29, 32.5, "宫保鸡丁：稳定，但像菜单默认头像。"),
    (32.5, 37.5, "景区伪川菜：只咸不香只剩辣，直接拉完。"),
    (37.5, 46.1, "真正的川菜，一城一味，一桌一江湖。评论区开排。"),
]

ROWS = [
    ("夯", "hot", ["麻婆豆腐", "水煮牛肉"]),
    ("顶级", "top", ["回锅肉", "辣子鸡", "鱼香肉丝"]),
    ("人上人", "human", ["夫妻肺片", "口水鸡"]),
    ("NPC", "npc", ["宫保鸡丁"]),
    ("拉完了", "low", ["景区伪川菜"]),
]

TIER_COLORS = {
    "hot": COLORS["signal"],
    "top": COLORS["yellow"],
    "human": (255, 242, 90),
    "npc": COLORS["surface"],
    "low": COLORS["white"],
}

CHIPS = [
    ("麻婆豆腐", 0, 38, 4.9, COLORS["signal"], 174),
    ("水煮牛肉", 0, 306, 8.1, COLORS["teal"], 174),
    ("回锅肉", 1, 28, 11.7, COLORS["signal"], 156),
    ("辣子鸡", 1, 244, 15.2, COLORS["teal"], 156),
    ("鱼香肉丝", 1, 462, 18.7, COLORS["yellow"], 180),
    ("夫妻肺片", 2, 36, 22.2, COLORS["signal"], 180),
    ("口水鸡", 2, 306, 25.7, COLORS["teal"], 156),
    ("宫保鸡丁", 3, 44, 29.2, COLORS["yellow"], 180),
    ("景区伪川菜", 4, 42, 32.7, COLORS["signal"], 264),
]


def clamp(value: float, lo: float = 0.0, hi: float = 1.0) -> float:
    return max(lo, min(hi, value))


def ease_out_cubic(value: float) -> float:
    x = clamp(value)
    return 1 - (1 - x) ** 3


def ease_in_out(value: float) -> float:
    x = clamp(value)
    return x * x * (3 - 2 * x)


def text_size(draw: ImageDraw.ImageDraw, text: str, fnt: ImageFont.FreeTypeFont) -> tuple[int, int]:
    box = draw.textbbox((0, 0), text, font=fnt)
    return box[2] - box[0], box[3] - box[1]


def draw_text_shadow(
    draw: ImageDraw.ImageDraw,
    xy: tuple[int, int],
    text: str,
    fnt: ImageFont.FreeTypeFont,
    fill: tuple[int, int, int],
    shadow: tuple[int, int, int] = COLORS["black"],
    offset: tuple[int, int] = (0, 5),
) -> None:
    x, y = xy
    draw.text((x + offset[0], y + offset[1]), text, font=fnt, fill=shadow)
    draw.text((x, y), text, font=fnt, fill=fill)


def wrap_text(draw: ImageDraw.ImageDraw, text: str, fnt: ImageFont.FreeTypeFont, max_width: int) -> list[str]:
    lines: list[str] = []
    current = ""
    for ch in text:
        candidate = current + ch
        if text_size(draw, candidate, fnt)[0] <= max_width or not current:
            current = candidate
        else:
            lines.append(current)
            current = ch
    if current:
        lines.append(current)
    return lines


def alpha_blend(base: Image.Image, overlay: Image.Image, alpha: float) -> None:
    if alpha <= 0:
        return
    if alpha < 1:
        overlay = overlay.copy()
        a = overlay.getchannel("A")
        overlay.putalpha(a.point(lambda px: int(px * alpha)))
    base.alpha_composite(overlay)


def current_caption(t: float) -> str:
    for start, end, caption in CAPTIONS:
        if start <= t < end:
            return caption
    return CAPTIONS[-1][2]


def draw_background(draw: ImageDraw.ImageDraw, t: float) -> None:
    draw.rectangle((0, 0, W, H), fill=COLORS["bg"])
    for x in range(64, W, 86):
        draw.line((x, 0, x, H), fill=(28, 31, 36), width=1)
    for y in range(160, H - 240, 150):
        draw.line((64, y, W - 64, y), fill=(25, 28, 32), width=1)
    pulse = int(24 + 18 * math.sin(t * math.pi * 0.9))
    draw.rectangle((0, 0, W, 18), fill=(233, 75, 53))
    draw.rectangle((0, 18, W, 26), fill=(242, 193, 78))
    draw.rectangle((0, 26, W, 30), fill=(43, 179, 163))
    draw.rectangle((64, 142, W - 64, 144), fill=(247, 242, 232, 34))
    draw.rectangle((64, H - 224, W - 64, H - 222), fill=(247, 242, 232, 34))
    draw.rectangle((64, 70, 64 + pulse, 76), fill=COLORS["teal"])


def draw_header(draw: ImageDraw.ImageDraw) -> None:
    draw.text((64, 82), "LOCAL TEST / HANG TO LA", font=FONTS["tag"], fill=COLORS["teal"])
    right = "主观娱乐榜"
    tw, _ = text_size(draw, right, FONTS["note"])
    draw.text((W - 64 - tw, 78), right, font=FONTS["note"], fill=(190, 196, 202))


def draw_intro(base: Image.Image, t: float) -> None:
    if t >= 5:
        return
    p_in = ease_out_cubic(t / 0.8)
    p_out = clamp((t - 4.15) / 0.65)
    alpha = p_in * (1 - p_out)
    y_shift = int((1 - p_in) * 58 - p_out * 28)
    layer = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    d = ImageDraw.Draw(layer)
    x, y = 82, 700 + y_shift
    d.text((x, y), "川菜从", font=FONTS["title"], fill=COLORS["text"])
    tw, _ = text_size(d, "川菜从", FONTS["title"])
    d.text((x + tw + 8, y), "夯", font=FONTS["title"], fill=COLORS["signal"])
    tw2, _ = text_size(d, "川菜从夯", FONTS["title"])
    d.text((x + tw2 + 16, y), "到拉", font=FONTS["title"], fill=COLORS["text"])
    d.text((84, y + 158), "主观娱乐榜，只聊第一口冲击力。", font=FONTS["subtitle"], fill=COLORS["surface"])
    d.rectangle((84, y + 232, 516, y + 240), fill=COLORS["yellow"])
    alpha_blend(base, layer, alpha)


def draw_board(base: Image.Image, t: float) -> None:
    p = ease_out_cubic((t - 3.4) / 0.7)
    if p <= 0:
        return
    layer = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    d = ImageDraw.Draw(layer)
    bx, by = 62, 284 + int((1 - p) * 46)
    bw, row_h, label_w = 956, 213, 146
    bh = row_h * 5
    d.rectangle((bx, by, bx + bw, by + bh), fill=COLORS["table"], outline=COLORS["grid"], width=3)
    for idx, (label, tier, _) in enumerate(ROWS):
        y = by + row_h * idx
        d.rectangle((bx, y, bx + bw, y + row_h), fill=COLORS["table"], outline=COLORS["grid"], width=3)
        d.rectangle((bx, y, bx + label_w, y + row_h), fill=TIER_COLORS[tier], outline=COLORS["grid"], width=3)
        fnt = FONTS["tier_small"] if tier == "low" else FONTS["tier"]
        tw, th = text_size(d, label, fnt)
        d.text((bx + (label_w - tw) / 2, y + (row_h - th) / 2 - 5), label, font=fnt, fill=(12, 12, 12))
    draw_chips(d, bx, by, t)
    alpha_blend(base, layer, p)


def draw_chips(draw: ImageDraw.ImageDraw, bx: int, by: int, t: float) -> None:
    row_h, label_w = 213, 146
    for text, row, x, start, accent, width in CHIPS:
        p = ease_out_cubic((t - start) / 0.48)
        if p <= 0:
            continue
        cx = bx + label_w + x + int((1 - p) * 760)
        cy = by + row_h * row + 66
        h = 74
        fill = COLORS["surface"]
        shadow_alpha = int(70 * p)
        draw.rectangle((cx + 8, cy + 8, cx + width + 8, cy + h + 8), fill=(14, 17, 22, shadow_alpha))
        draw.rectangle((cx, cy, cx + width, cy + h), fill=fill, outline=COLORS["bg"], width=3)
        draw.rectangle((cx + 16, cy + 20, cx + 30, cy + 54), fill=accent)
        tw, th = text_size(draw, text, FONTS["chip"])
        draw.text((cx + 44, cy + (h - th) / 2 - 3), text, font=FONTS["chip"], fill=COLORS["bg"])


def draw_score(draw: ImageDraw.ImageDraw, t: float) -> None:
    thresholds = [4.9, 8.1, 11.7, 15.2, 18.7, 22.2, 25.7, 29.2, 32.7]
    bar_w, gap = 34, 10
    x0, y = W - 70 - (bar_w * len(thresholds) + gap * (len(thresholds) - 1)), 1386
    for idx in range(len(thresholds)):
        fill = COLORS["teal"] if t >= thresholds[idx] else (247, 242, 232)
        if t < thresholds[idx]:
            fill = (60, 64, 70)
        x = x0 + idx * (bar_w + gap)
        draw.rectangle((x, y, x + bar_w, y + 10), fill=fill)


def draw_caption(draw: ImageDraw.ImageDraw, t: float) -> None:
    caption = current_caption(t)
    lines = wrap_text(draw, caption, FONTS["caption"], 930)
    total_h = len(lines) * 70
    y = H - 102 - total_h
    for line in lines:
        tw, _ = text_size(draw, line, FONTS["caption"])
        draw_text_shadow(draw, ((W - tw) // 2, y), line, FONTS["caption"], COLORS["yellow"])
        y += 70


def draw_closing(base: Image.Image, t: float) -> None:
    p = ease_out_cubic((t - 37.4) / 0.8)
    if p <= 0:
        return
    layer = Image.new("RGBA", (W, H), (14, 17, 22, int(198 * p)))
    d = ImageDraw.Draw(layer)
    title = "真正的川菜：一城一味，"
    title2 = "一桌一江湖。"
    cta = "评论区开排"
    y = 1092 + int((1 - p) * 42)
    draw_text_shadow(d, (80, y), title, FONTS["close"], COLORS["text"], offset=(0, 4))
    draw_text_shadow(d, (80, y + 88), title2, FONTS["close"], COLORS["text"], offset=(0, 4))
    d.text((82, y + 210), cta, font=FONTS["close_small"], fill=COLORS["teal"])
    d.rectangle((82, y + 280, 522, y + 290), fill=COLORS["yellow"])
    alpha_blend(base, layer, p)


def render_frame(t: float) -> Image.Image:
    img = Image.new("RGBA", (W, H), COLORS["bg"] + (255,))
    draw = ImageDraw.Draw(img, "RGBA")
    draw_background(draw, t)
    draw_header(draw)
    draw_board(img, t)
    draw_score(draw, t)
    draw_intro(img, t)
    draw_closing(img, t)
    draw_caption(draw, t)
    return img.convert("RGB")


def write_contact_sheet() -> None:
    samples = [1.8, 5.5, 8.7, 12.4, 15.9, 19.4, 22.9, 26.4, 29.9, 33.5, 42.2]
    thumb_w, thumb_h = 270, 480
    cols, rows = 3, 4
    sheet = Image.new("RGB", (cols * thumb_w, rows * thumb_h), COLORS["bg"])
    d = ImageDraw.Draw(sheet)
    for index, t in enumerate(samples):
        frame = render_frame(t)
        frame.thumbnail((thumb_w, thumb_h), Image.Resampling.LANCZOS)
        x = (index % cols) * thumb_w
        y = (index // cols) * thumb_h
        sheet.paste(frame, (x, y))
        d.text((x + 8, y + 8), f"{t:04.1f}s", font=font(FONT_LATIN, 20), fill=COLORS["yellow"])
    sheet.save(CONTACT_OUT, quality=92)


def write_video() -> None:
    cmd = [
        "ffmpeg",
        "-y",
        "-f",
        "rawvideo",
        "-pix_fmt",
        "rgb24",
        "-s",
        f"{W}x{H}",
        "-r",
        str(FPS),
        "-i",
        "-",
    ]
    if AUDIO.exists():
        cmd.extend(["-i", str(AUDIO), "-map", "0:v:0", "-map", "1:a:0"])
    else:
        cmd.extend(["-map", "0:v:0"])
    cmd.extend([
        "-t",
        f"{DURATION:.3f}",
        "-c:v",
        "libx264",
        "-pix_fmt",
        "yuv420p",
        "-preset",
        "veryfast",
        "-crf",
        "22",
    ])
    if AUDIO.exists():
        cmd.extend(["-c:a", "aac", "-b:a", "128k"])
    cmd.append(str(VIDEO_OUT))

    proc = subprocess.Popen(cmd, stdin=subprocess.PIPE)
    assert proc.stdin is not None
    total = int(DURATION * FPS)
    for frame_index in range(total):
        t = frame_index / FPS
        frame = render_frame(t)
        proc.stdin.write(frame.tobytes())
    proc.stdin.close()
    rc = proc.wait()
    if rc != 0:
        raise RuntimeError(f"ffmpeg failed with exit code {rc}")


def main() -> None:
    EXPORT_DIR.mkdir(parents=True, exist_ok=True)
    write_contact_sheet()
    write_video()
    print(f"video={VIDEO_OUT}")
    print(f"contact_sheet={CONTACT_OUT}")


if __name__ == "__main__":
    main()
