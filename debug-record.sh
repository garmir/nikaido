#!/usr/bin/env bash
# Display recording for debugging ghostty spawning
# Records screen activity to debug agent spawning issues

DEBUG_DIR="/home/a/.claude/debug-recordings"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
RECORDING_FILE="$DEBUG_DIR/debug-recording-$TIMESTAMP.mp4"

# Create debug directory
mkdir -p "$DEBUG_DIR"

echo "=== Display Recording Debug ==="
echo "Starting 10-second recording to debug ghostty spawning..."
echo "File: $RECORDING_FILE"

# Try wf-recorder with proper user environment
echo "Attempting recording via wf-recorder..."
if sudo -u a bash -c "
    export XDG_RUNTIME_DIR=/run/user/1000
    export WAYLAND_DISPLAY=wayland-1
    export XDG_CURRENT_DESKTOP=Hyprland
    timeout 10 wf-recorder -f '$RECORDING_FILE'
" 2>/dev/null; then
    echo "✅ Recording captured via wf-recorder"
    ls -la "$RECORDING_FILE"
    exit 0
fi

# Fallback: Try with nix-shell
echo "Attempting via nix-shell wf-recorder..."
if nix-shell -p wf-recorder --run "
    sudo -u a bash -c '
        export XDG_RUNTIME_DIR=/run/user/1000
        export WAYLAND_DISPLAY=wayland-1
        timeout 10 wf-recorder -f $RECORDING_FILE
    '
" 2>/dev/null; then
    echo "✅ Recording captured via nix-shell"
    exit 0
fi

echo "❌ Recording failed. Check environment manually."