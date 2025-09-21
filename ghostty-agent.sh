#!/usr/bin/env bash
# Persistent ghostty agent script
# This script runs inside spawned ghostty windows

# Check if task was passed as argument
TASK="$1"

echo "=== Claude Code Agent Starting ==="
echo "Agent running in nix-shell environment"
echo "Agent PID: $$"
echo "Task: ${TASK:-'Interactive mode'}"
echo

# Start nix-shell with nodejs and run Claude Code
if [ -n "$TASK" ]; then
    echo "Auto-executing task: $TASK"
    echo
    echo "$TASK" | nix-shell -p nodejs --run "npx @anthropic-ai/claude-code --continue"
else
    echo "Interactive mode - type your task:"
    nix-shell -p nodejs --run "npx @anthropic-ai/claude-code --continue"
fi

echo
echo "=== Agent Task Complete ==="
echo "Press Enter to close this window..."
read