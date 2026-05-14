#!/bin/bash

EVENT_DEVICE="/dev/input/event2"
SCREENSHOT_DIR="/roms/backup"
LOGFILE="$SCREENSHOT_DIR/es_screenshot_log.txt"

mkdir -p "$SCREENSHOT_DIR"

echo "Daemon started $(date)" >> "$LOGFILE"

BTN_TL2=0
BTN_TR2=0

take_screenshot() {
    TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
    OUTPUT="$SCREENSHOT_DIR/screenshot_$TIMESTAMP.png"

    if ffmpeg -f fbdev -i /dev/fb0 -vframes 1 -y "$OUTPUT" >> "$LOGFILE" 2>&1; then
        echo "Screenshot saved: $OUTPUT" >> "$LOGFILE"
    else
        echo "Screenshot failed $(date)" >> "$LOGFILE"
    fi
}

while read -r line; do

    if echo "$line" | grep -q "code 312 (BTN_TL2)"; then
        BTN_TL2=$(echo "$line" | grep -q "value 1" && echo 1 || echo 0)
    elif echo "$line" | grep -q "code 313 (BTN_TR2)"; then
        BTN_TR2=$(echo "$line" | grep -q "value 1" && echo 1 || echo 0)
    fi

    if [ "$BTN_TL2" -eq 1 ] && [ "$BTN_TR2" -eq 1 ]; then
        take_screenshot
        BTN_TL2=0
        BTN_TR2=0
        sleep 1
    fi

done < <(evtest "$EVENT_DEVICE" 2>/dev/null)
