#!/run/current-system/sw/bin/bash
# Spawn Claude Code agent in new ghostty window following RULES.md
# Pattern: ghostty > nix-shell -p nodejs > npx @anthropic-ai/claude-code --continue

TASK="$1"
AGENT_TYPE="${2:-quality-engineer}"

echo "Spawning new ghostty window with agent..."
echo "Task: $TASK"
echo "Agent Type: $AGENT_TYPE"

# Use Hyprland to spawn new ghostty window with the exact pattern specified
echo 7 | sudo -S -u a bash -c "
export HYPRLAND_INSTANCE_SIGNATURE='4e242d086e20b32951fdc0ebcbfb4d41b5be8dcc_1758175785_157231025'
hyprctl dispatch exec \"ghostty --command='bash -c \\\"nix-shell -p nodejs --run \\\\\\\"npx @anthropic-ai/claude-code --continue\\\\\\\"\\\"'\"
"

echo "New ghostty window spawned with Claude Code agent"
echo "Agent will auto-execute: nix-shell -p nodejs > npx @anthropic-ai/claude-code --continue"