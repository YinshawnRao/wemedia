#!/usr/bin/env bash
set -u

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
OUT_FILE="${1:-$ROOT_DIR/env_report.md}"

cmd_exists() {
  command -v "$1" >/dev/null 2>&1
}

value_or_missing() {
  if cmd_exists "$1"; then
    "$@" 2>&1 | head -n 1
  else
    printf 'missing'
  fi
}

os_name="$(uname -s 2>/dev/null || printf unknown)"
os_arch="$(uname -m 2>/dev/null || printf unknown)"
os_detail="$os_name $os_arch"
if [[ "$os_name" == "Darwin" ]] && cmd_exists sw_vers; then
  os_detail="$(sw_vers -productName) $(sw_vers -productVersion) ($os_arch)"
fi

python_version="$(value_or_missing python3 --version)"
conda_version="$(value_or_missing conda --version)"
uv_version="$(value_or_missing uv --version)"
ffmpeg_version="$(value_or_missing ffmpeg -version)"
ffprobe_version="$(value_or_missing ffprobe -version)"
git_version="$(value_or_missing git --version)"
git_lfs_version="$(value_or_missing git-lfs --version)"

hardware="CPU"
gpu_notes="未检测到 CUDA；默认按 CPU 路径。"
if cmd_exists nvidia-smi; then
  hardware="CUDA"
  gpu_notes="$(nvidia-smi --query-gpu=name,driver_version,memory.total --format=csv,noheader 2>/dev/null | head -n 1 || printf 'CUDA detected')"
elif [[ "$os_name" == "Darwin" ]]; then
  chip="$(sysctl -n machdep.cpu.brand_string 2>/dev/null || printf unknown)"
  if [[ "$os_arch" == "arm64" ]]; then
    hardware="MPS"
    gpu_notes="Apple Silicon / MPS candidate: $chip"
  else
    gpu_notes="macOS Intel CPU: $chip"
  fi
fi

disk_free="$(df -h "$ROOT_DIR" 2>/dev/null | awk 'NR==2 {print $4 " free of " $2 " on " $1}')"
now="$(date '+%Y-%m-%d %H:%M:%S %Z')"

{
  printf '%s\n\n' '# 本机环境检测'
  printf '%s\n' "- 检测时间: $now"
  printf '%s\n' "- 工作目录: \`$ROOT_DIR\`"
  printf '%s\n' "- 操作系统: $os_detail"
  printf '%s\n' "- Python: \`$python_version\`"
  printf '%s\n' "- conda: \`$conda_version\`"
  printf '%s\n' "- uv: \`$uv_version\`"
  printf '%s\n' "- ffmpeg: \`$ffmpeg_version\`"
  printf '%s\n' "- ffprobe: \`$ffprobe_version\`"
  printf '%s\n' "- git: \`$git_version\`"
  printf '%s\n' "- git-lfs: \`$git_lfs_version\`"
  printf '%s\n' "- 推理硬件判断: \`$hardware\`"
  printf '%s\n' "- 硬件说明: $gpu_notes"
  printf '%s\n\n' "- 磁盘剩余空间: ${disk_free:-unknown}"
  printf '%s\n\n' '## 缺失项建议'
  if [[ "$ffmpeg_version" == missing ]]; then
    if [[ "$os_name" == "Darwin" ]]; then
      printf '%s\n' '- ffmpeg 缺失：macOS 建议 `brew install ffmpeg`。'
    elif [[ "$os_name" == "Linux" ]]; then
      printf '%s\n' '- ffmpeg 缺失：Linux 建议 `sudo apt install ffmpeg`。'
    else
      printf '%s\n' '- ffmpeg 缺失：Windows 建议手动安装并加入 PATH。'
    fi
  fi
  if [[ "$uv_version" == missing ]]; then
    printf '%s\n' '- uv 缺失：可用 `pip install -U uv` 安装。'
  fi
  if [[ "$git_lfs_version" == missing ]]; then
    printf '%s\n' '- git-lfs 缺失：模型仓库可能拉不完整，建议安装后再执行 `git lfs pull`。'
  fi
  if [[ "$ffmpeg_version" != missing && "$uv_version" != missing && "$git_lfs_version" != missing ]]; then
    printf '%s\n' '- 未发现关键缺失项。'
  fi
} > "$OUT_FILE"

cat "$OUT_FILE"
