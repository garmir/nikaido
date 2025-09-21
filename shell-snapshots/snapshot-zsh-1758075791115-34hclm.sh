# Snapshot file
# Unset all aliases to avoid conflicts with functions
unalias -a 2>/dev/null || true
# Check for rg availability
if ! command -v rg >/dev/null 2>&1; then
  alias rg='/home/a/.npm-global/lib/node_modules/\@anthropic-ai/claude-code/vendor/ripgrep/x64-linux/rg'
fi
export PATH=/home/a/.npm-global/bin\:/home/a/.npm-global/bin\:/run/wrappers/bin\:/home/a/.nix-profile/bin\:/nix/profile/bin\:/home/a/.local/state/nix/profile/bin\:/etc/profiles/per-user/a/bin\:/nix/var/nix/profiles/default/bin\:/run/current-system/sw/bin
