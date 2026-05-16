#!/usr/bin/env python3
from __future__ import annotations

import subprocess
from pathlib import Path
from typing import Any

from PIL import Image, ImageDraw, ImageFont


ROOT_DIR = Path(__file__).resolve().parents[2]
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


class Top5Renderer:
    def __init__(self, experiment_id: str, output_slug: str) -> None:
        self.experiment_id = experiment_id
        self.output_slug = output_slug
        self.raw_dir = ROOT_DIR / f"sandbox/yt-dlp/clips/{experiment_id}"
        self.project_dir = ROOT_DIR / f"sandbox/hyperframes/{experiment_id}"
        self.asset_dir = self.project_dir / "assets"
        self.out_dir = ROOT_DIR / f"sandbox/exports/{experiment_id}"
        self.work_dir = self.out_dir / f"ffmpeg_{output_slug}_work"
        self.overlay_dir = self.work_dir / "overlays"
        self.segment_dir = self.work_dir / "segments"
        self.final_out = self.out_dir / f"{output_slug}-preview.mp4"
        self.contact_sheet = self.out_dir / f"{output_slug}-contact-sheet.jpg"

    def ensure_dirs(self) -> None:
        for path in (self.asset_dir, self.overlay_dir, self.segment_dir, self.out_dir):
            path.mkdir(parents=True, exist_ok=True)

    def find_clip(self, video_id: str) -> Path:
        matches = sorted(self.raw_dir.glob(f"*{video_id}*.mp4"))
        if not matches:
            raise FileNotFoundError(f"Missing source for {video_id}")
        return matches[0]

    def process_asset(self, video_id: str, out_name: str, fade_start: str) -> None:
        src = self.find_clip(video_id)
        out = self.asset_dir / f"{out_name}.mp4"
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

    def make_title_overlay(self, file: str, eyebrow: str, title_a: str, title_b: str, subtitle: str, note: str) -> None:
        img = Image.new("RGBA", (W, H), COLORS["bg"])
        draw = ImageDraw.Draw(img, "RGBA")
        rect(draw, (0, 0, W, 24), COLORS["signal"])
        rect(draw, (0, 24, W, 40), COLORS["support"])
        rect(draw, (72, 548, 84, 1036), COLORS["highlight"])
        text(draw, (72, 178), eyebrow, size=34, fill=COLORS["support"])
        text(draw, (112, 645), title_a, size=84, fill=COLORS["text"])
        if title_b:
            text(draw, (112, 767), title_b, size=84, fill=COLORS["highlight"])
        text(draw, (72, 1596), subtitle, size=34, fill=COLORS["surface"])
        text(draw, (72, 1668), note, size=24, fill=COLORS["soft"])
        img.save(self.overlay_dir / f"{file}.png")

    def make_rank_overlay(
        self,
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
        img.save(self.overlay_dir / f"{file}.png")

    def render_overlay_segment(self, input_video: Path, overlay_name: str, output: Path) -> None:
        run(
            [
                "ffmpeg",
                "-v",
                "error",
                "-y",
                "-i",
                input_video,
                "-i",
                self.overlay_dir / f"{overlay_name}.png",
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

    def render_title_segment(self, overlay_name: str, duration: str, output: Path) -> None:
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
                self.overlay_dir / f"{overlay_name}.png",
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

    def concat_segments(self, files: list[Path]) -> None:
        concat = self.work_dir / "concat.txt"
        concat.write_text("".join(f"file '{path}'\n" for path in files), encoding="utf-8")
        run(["ffmpeg", "-v", "error", "-y", "-f", "concat", "-safe", "0", "-i", concat, "-c", "copy", "-movflags", "+faststart", self.final_out])

    def make_contact_sheet(self, stamps: list[int]) -> None:
        frames_dir = self.out_dir / "contact_frames"
        frames_dir.mkdir(parents=True, exist_ok=True)
        for idx, stamp in enumerate(stamps):
            run(["ffmpeg", "-v", "error", "-y", "-ss", str(stamp), "-i", self.final_out, "-frames:v", "1", frames_dir / f"frame_{idx:02d}.png"])
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
                f"scale=180:-2,tile={len(stamps)}x1,format=yuvj420p",
                "-q:v",
                "3",
                self.contact_sheet,
            ]
        )


def render_top5_video(
    *,
    experiment_id: str,
    output_slug: str,
    intro: dict[str, str],
    closing: dict[str, str],
    clips: list[dict[str, Any]],
    contact_stamps: list[int],
) -> tuple[Path, Path]:
    renderer = Top5Renderer(experiment_id, output_slug)
    renderer.ensure_dirs()

    for clip in clips:
        renderer.process_asset(clip["video_id"], clip["asset"], clip["fade_start"])

    renderer.make_title_overlay("00-intro", intro["eyebrow"], intro["title_a"], intro["title_b"], intro["subtitle"], intro["note"])
    intro_path = renderer.segment_dir / "00-intro.mp4"
    renderer.render_title_segment("00-intro", "5.0", intro_path)

    segment_paths = [intro_path]
    for idx, clip in enumerate(clips, start=1):
        renderer.make_rank_overlay(
            clip["asset"],
            clip["accent"],
            clip["header"],
            clip["song"],
            clip["performer"],
            clip["credits"],
            clip["detail"],
            clip["source"],
        )
        segment = renderer.segment_dir / f"{idx:02d}-{clip['asset']}.mp4"
        renderer.render_overlay_segment(renderer.asset_dir / f"{clip['asset']}.mp4", clip["asset"], segment)
        segment_paths.append(segment)

    renderer.make_title_overlay("99-closing", closing["eyebrow"], closing["title_a"], closing["title_b"], closing["subtitle"], closing["note"])
    closing_path = renderer.segment_dir / "99-closing.mp4"
    renderer.render_title_segment("99-closing", "5.0", closing_path)
    segment_paths.append(closing_path)

    renderer.concat_segments(segment_paths)
    renderer.make_contact_sheet(contact_stamps)
    print(renderer.final_out)
    return renderer.final_out, renderer.contact_sheet
