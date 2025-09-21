#!/run/current-system/sw/bin/bash
# Working ghostty agent spawning script
# Fixes authorization issues by running in proper user context

TASK="$1"
AGENT_ID="${2:-agent_$(date +%s)}"

echo "Spawning working ghostty agent: $AGENT_ID"
echo "Task: $TASK"

# Create agent workspace
mkdir -p "/home/a/nix-modules/agents/$AGENT_ID"

# Create agent script that will run in the spawned window
cat > "/home/a/nix-modules/agents/$AGENT_ID/agent.sh" << EOF
#!/run/current-system/sw/bin/bash
cd /home/a/nix-modules
echo "Agent $AGENT_ID starting..."
echo "Task: $TASK"
echo
echo "Task ready: $TASK"
echo "Starting Claude Code in headless mode..."
nix-shell -p nodejs --run "npx @anthropic-ai/claude-code -p '$TASK' --output-format text"
echo "Agent task completed. Closing window in 5 seconds..."
sleep 5
exit
EOF

chmod +x "/home/a/nix-modules/agents/$AGENT_ID/agent.sh"

# Run as user 'a' with proper environment
sudo -u a bash -c "
export HYPRLAND_INSTANCE_SIGNATURE='4e242d086e20b32951fdc0ebcbfb4d41b5be8dcc_1758175785_157231025'
export XDG_RUNTIME_DIR='/run/user/\$(id -u)'
export WAYLAND_DISPLAY='wayland-1'
cd /home/a/nix-modules
ghostty -e '/home/a/nix-modules/agents/$AGENT_ID/agent.sh' &
"

echo "Agent $AGENT_ID spawned in new ghostty window"