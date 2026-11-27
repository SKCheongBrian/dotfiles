#!/usr/bin/env bash

CONFIG="$HOME/.config/hypr/touchpad.lua"

awk '
    /enabled = true/  { sub(/enabled = true/, "enabled = false"); print; next }
    /enabled = false/ { sub(/enabled = false/, "enabled = true"); print; next }
    { print }
' "$CONFIG" > "$CONFIG.tmp" &&
mv "$CONFIG.tmp" "$CONFIG"
