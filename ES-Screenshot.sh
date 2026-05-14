#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
nohup bash "$SCRIPT_DIR/ESScreenshot/screenshot_daemon.sh" >/dev/null 2>&1 &
exit 0
