#!/usr/bin/env bash
# Screenshot debugging capability for Claude Code
# Handles Wayland/Hyprland screenshot capture with proper environment

DEBUG_DIR="/home/a/.claude/debug-screenshots"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
SCREENSHOT_FILE="$DEBUG_DIR/debug-$TIMESTAMP.png"

# Create debug directory if it doesn't exist
mkdir -p "$DEBUG_DIR"

echo "=== Claude Code Debug Screenshot ==="
echo "Timestamp: $(date)"
echo "Screenshot file: $SCREENSHOT_FILE"
echo

# Method 1: Try grim with proper Wayland environment (user context)
echo "Attempting screenshot via grim (Wayland)..."
if sudo -u a bash -c "
    export XDG_RUNTIME_DIR=/run/user/1000
    export XDG_CURRENT_DESKTOP=Hyprland
    export XDG_SESSION_TYPE=wayland
    export WAYLAND_DISPLAY=wayland-1
    grim '$SCREENSHOT_FILE'
" 2>/dev/null; then
    echo "✅ Screenshot captured via grim"
    echo "File: $SCREENSHOT_FILE"
    ls -la "$SCREENSHOT_FILE"
    exit 0
fi

# Method 2: Try hyprshot if available
echo "Attempting screenshot via hyprshot..."
if command -v hyprshot >/dev/null 2>&1; then
    if sudo -u a bash -c "
        export HYPRLAND_INSTANCE_SIGNATURE='4e242d086e20b32951fdc0ebcbfb4d41b5be8dcc_1758175785_157231025'
        hyprshot -m output -o '$DEBUG_DIR' -f 'debug-$TIMESTAMP.png'
    " 2>/dev/null; then
        echo "✅ Screenshot captured via hyprshot"
        exit 0
    fi
fi

# Method 3: Try grim via nix-shell with user environment
echo "Attempting screenshot via nix-shell grim..."
if nix-shell -p grim --run "
    sudo -u a bash -c '
        export XDG_RUNTIME_DIR=/run/user/1000
        export WAYLAND_DISPLAY=wayland-1
        grim $SCREENSHOT_FILE
    '
" 2>/dev/null; then
    echo "✅ Screenshot captured via nix-shell grim"
    exit 0
fi

# Method 4: Fallback - check if we can at least validate the environment
echo "Screenshot capture failed. Checking environment..."
echo "XDG_RUNTIME_DIR: ${XDG_RUNTIME_DIR:-'not set'}"
echo "WAYLAND_DISPLAY: ${WAYLAND_DISPLAY:-'not set'}"
echo "XDG_CURRENT_DESKTOP: ${XDG_CURRENT_DESKTOP:-'not set'}"
echo "User runtime dir exists: $(test -d /run/user/1000 && echo 'yes' || echo 'no')"

echo
echo "❌ Screenshot capture failed. Manual debug required."
echo "Available debug files in: $DEBUG_DIR"
ls -la "$DEBUG_DIR" 2>/dev/null || echo "No previous debug files found."