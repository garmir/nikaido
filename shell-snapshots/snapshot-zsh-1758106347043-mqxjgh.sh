# Snapshot file
# Unset all aliases to avoid conflicts with functions
unalias -a 2>/dev/null || true
# Check for rg availability
if ! command -v rg >/dev/null 2>&1; then
  alias rg='/home/a/.npm-global/lib/node_modules/\@anthropic-ai/claude-code/vendor/ripgrep/x64-linux/rg'
fi
export PATH=/home/a/.npm-global/bin\:/home/a/.local/bin\:/home/a/.local/lib/hyde:\:/home/a/.npm-global/bin\:/run/wrappers/bin\:/home/a/.nix-profile/bin\:/nix/profile/bin\:/home/a/.local/state/nix/profile/bin\:/etc/profiles/per-user/a/bin\:/nix/var/nix/profiles/default/bin\:/run/current-system/sw/bin\:/nix/store/ky2x48xfid0nn5arablpwlnsngj70gws-binutils-wrapper-2.44/bin\:/nix/store/jlgm3d296k50w4nar645d3zch8xs332s-hyprland-qtutils-0.1.4/bin\:/nix/store/83clm3iscfyi4prrar8rbandrmss5sfd-pciutils-3.14.0/bin\:/nix/store/b6wz03kpkjvn6accwhnw6k6qki628dnx-pkgconf-wrapper-2.4.3/bin\:/nix/store/1grjzncwglhkmc7xkygdqb6gzr0qmafs-kitty-0.42.2/bin\:/nix/store/k8y6i1p76dj8qz67r3i4i0m264mvkjpv-imagemagick-7.1.2-2/bin\:/nix/store/dq8kr0g1dhg017y6ys0hxnjkqmlaqyaw-ncurses-6.5-dev/bin
