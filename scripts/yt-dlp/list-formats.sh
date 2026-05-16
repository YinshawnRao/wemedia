#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <youtube_url>" >&2
  echo "Example: $0 'https://www.youtube.com/watch?v=VIDEO_ID'" >&2
  exit 1
fi

URL="$1"

init_dirs
ensure_tools

run_ytdlp "list-formats" "-" "$URL" "${BASE_ARGS[@]}" -F "$URL"
