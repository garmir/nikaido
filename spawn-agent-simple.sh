#!/bin/bash
# Simple ghostty agent spawning with direct task piping
# Usage: spawn-agent-simple.sh "task description"

TASK="$1"

echo "Spawning agent with task: $TASK"

# Use hyprctl to spawn ghostty with direct command that pipes task to Claude
echo 7 | sudo -S -u a bash -c "
export HYPRLAND_INSTANCE_SIGNATURE='4e242d086e20b32951fdc0ebcbfb4d41b5be8dcc_1758175785_157231025'
hyprctl dispatch exec 'ghostty --command=\"bash -c \\\"echo \\\\\\\"$TASK\\\\\\\" | nix-shell -p nodejs --run \\\\\\\"npx @anthropic-ai/claude-code --continue\\\\\\\"\\\"\"'
"

echo "Agent spawned successfully in new ghostty window"