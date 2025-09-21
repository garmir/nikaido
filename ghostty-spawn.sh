#!/usr/bin/env bash
# Ghostty Agent Spawning Script
# Spawns Claude Code agents in independent ghostty windows
# Usage: ghostty-spawn.sh "task description" [agent-type]

TASK="$1"
AGENT_TYPE="${2:-quality-engineer}"

# Verify we're in a GUI session
if [ -z "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
    echo "Error: No display available for ghostty window spawning"
    exit 1
fi

# Create agent execution script with task injection
AGENT_SCRIPT="/tmp/claude-agent-$$-$(date +%s).sh"
cat > "$AGENT_SCRIPT" << EOF
#!/usr/bin/env bash
# Agent execution wrapper

echo "Starting Claude Code agent in nix-shell..."
echo "Agent Type: $AGENT_TYPE"
echo "Task: $TASK"
echo

# Enter nix-shell with nodejs and spawn Claude, then send task
nix-shell -p nodejs --run "
    echo 'Initializing Claude Code agent...'
    echo 'Task will be sent after initialization...'

    # Start Claude and send task after brief delay
    {
        sleep 3
        echo '$TASK'
    } | npx @anthropic-ai/claude-code --continue
"

# Keep window open for user to see results
echo "Agent task complete. Press any key to close window..."
read -n 1
exit
EOF

chmod +x "$AGENT_SCRIPT"

# Spawn new ghostty window via Hyprland with agent script and task (as user)
sudo -u a bash -c 'export HYPRLAND_INSTANCE_SIGNATURE="4e242d086e20b32951fdc0ebcbfb4d41b5be8dcc_1758175785_157231025" && hyprctl dispatch exec "ghostty -e \"/home/a/.claude/ghostty-agent.sh '"'"'$TASK'"'"'\""' &

GHOSTTY_PID=$!
echo "Spawned ghostty agent window (PID: $GHOSTTY_PID)"
echo "Task: $TASK"
echo "Agent Type: $AGENT_TYPE"

# Clean up script after use
sleep 2
rm -f "$AGENT_SCRIPT"

echo "Agent spawned successfully. Window will auto-close when task complete."