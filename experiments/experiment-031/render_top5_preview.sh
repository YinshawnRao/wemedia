#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
PYTHONPYCACHEPREFIX="${ROOT_DIR}/sandbox/pycache" python3 "${ROOT_DIR}/experiments/experiment-031/render_top5_preview_pillow.py"

