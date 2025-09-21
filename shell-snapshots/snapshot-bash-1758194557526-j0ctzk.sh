# Snapshot file
# Unset all aliases to avoid conflicts with functions
unalias -a 2>/dev/null || true
# Functions
# Shell Options
shopt -u array_expand_once
shopt -u assoc_expand_once
shopt -u autocd
shopt -u bash_source_fullpath
shopt -u cdable_vars
shopt -u cdspell
shopt -u checkhash
shopt -u checkjobs
shopt -s checkwinsize
shopt -s cmdhist
shopt -u compat31
shopt -u compat32
shopt -u compat40
shopt -u compat41
shopt -u compat42
shopt -u compat43
shopt -u compat44
shopt -s complete_fullquote
shopt -u direxpand
shopt -u dirspell
shopt -u dotglob
shopt -u execfail
shopt -u expand_aliases
shopt -u extdebug
shopt -u extglob
shopt -s extquote
shopt -u failglob
shopt -s force_fignore
shopt -s globasciiranges
shopt -s globskipdots
shopt -u globstar
shopt -u gnu_errfmt
shopt -u histappend
shopt -u histreedit
shopt -u histverify
shopt -s hostcomplete
shopt -u huponexit
shopt -u inherit_errexit
shopt -s interactive_comments
shopt -u lastpipe
shopt -u lithist
shopt -u localvar_inherit
shopt -u localvar_unset
shopt -s login_shell
shopt -u mailwarn
shopt -u no_empty_cmd_completion
shopt -u nocaseglob
shopt -u nocasematch
shopt -u noexpand_translation
shopt -u nullglob
shopt -s patsub_replacement
shopt -s progcomp
shopt -u progcomp_alias
shopt -s promptvars
shopt -u restricted_shell
shopt -u shift_verbose
shopt -s sourcepath
shopt -u varredir_close
shopt -u xpg_echo
set -o braceexpand
set -o hashall
set -o interactive-comments
set -o monitor
set -o onecmd
shopt -s expand_aliases
# Aliases
# Check for rg availability
if ! command -v rg >/dev/null 2>&1; then
  alias rg='/home/a/.npm/_npx/becf7b9e49303068/node_modules/\@anthropic-ai/claude-code/vendor/ripgrep/x64-linux/rg'
fi
export PATH=/home/a/.npm/_npx/becf7b9e49303068/node_modules/.bin\:/home/a/nix-modules/node_modules/.bin\:/home/a/node_modules/.bin\:/home/node_modules/.bin\:/node_modules/.bin\:/nix/store/9d235766g7alzlalw4z8yqxql0jl2mgd-nodejs-22.18.0/lib/node_modules/npm/node_modules/\@npmcli/run-script/lib/node-gyp-bin\:/nix/store/7xqn2kis5gaa01r6p95zw700k4lw0lxp-bash-interactive-5.3p3/bin\:/nix/store/b3rsa3r13bkp8hr5g3pncxpb6b3crvxl-patchelf-0.15.0/bin\:/nix/store/bcw9f6r9v2fm3kv7d15fcrya0mf34xds-gcc-wrapper-14.3.0/bin\:/nix/store/qdknxw57cwy1jkrhq7fzmiis73j42jv6-gcc-14.3.0/bin\:/nix/store/j941hd82ybw2czd7lgf3xwccmqy9281h-glibc-2.40-66-bin/bin\:/nix/store/xbp2j3z0lhizr5vvzff4dgdcxgs8i2w7-coreutils-9.7/bin\:/nix/store/ky2x48xfid0nn5arablpwlnsngj70gws-binutils-wrapper-2.44/bin\:/nix/store/xrwdb41dqi2ia6lr2s61w5bzfg2m71pi-binutils-2.44/bin\:/nix/store/mjgd69ahrwz5skifd30a87l1gb7yc785-nodejs-22.18.0-dev/bin\:/nix/store/9d235766g7alzlalw4z8yqxql0jl2mgd-nodejs-22.18.0/bin\:/nix/store/xbp2j3z0lhizr5vvzff4dgdcxgs8i2w7-coreutils-9.7/bin\:/nix/store/bn3p3g6lsl0wa4ybrvik5rk4j5h3q7lb-findutils-4.10.0/bin\:/nix/store/wjd5xfqk2cm55wfkc0nyxlg38d1h17x0-diffutils-3.12/bin\:/nix/store/i74283mw5bncn16i0zbz0lvvq4sn0q87-gnused-4.9/bin\:/nix/store/5ygilvgz6l47fw3x5ylb0cz1afgc3737-gnugrep-3.12/bin\:/nix/store/0f4bvykzxsjvxh01jh1zai6s5jjlrach-gawk-5.3.2/bin\:/nix/store/wa302h6k7rvrp6mzvq96swdyh3np0cyh-gnutar-1.35/bin\:/nix/store/6w3g3nzyqqvhv36q2xj22k4d9vw3jl7h-gzip-1.14/bin\:/nix/store/yiwcf5lsmalda0211g2nra5p20vmbp3q-bzip2-1.0.8-bin/bin\:/nix/store/3aliwf9m0ji0fvpb6dg5hhp691fsvi1p-gnumake-4.4.1/bin\:/nix/store/4bacfs7zrg714ffffbjp57nsvcz6zfkq-bash-5.3p3/bin\:/nix/store/8j75alqms3ldbds4b4zip9mmy4af59ml-patch-2.8/bin\:/nix/store/fksqvzy6pc1a4rbpyyiq4932m22aq5h4-xz-5.8.1-bin/bin\:/nix/store/z08sfbfszjqfd52v6ccw35l332rfskz6-file-5.45/bin\:/home/a/.npm-global/bin\:/home/a/.local/bin\:/home/a/.local/lib/hyde:\:/home/a/.npm-global/bin\:/run/wrappers/bin\:/home/a/.nix-profile/bin\:/nix/profile/bin\:/home/a/.local/state/nix/profile/bin\:/etc/profiles/per-user/a/bin\:/nix/var/nix/profiles/default/bin\:/run/current-system/sw/bin\:/nix/store/ky2x48xfid0nn5arablpwlnsngj70gws-binutils-wrapper-2.44/bin\:/nix/store/jlgm3d296k50w4nar645d3zch8xs332s-hyprland-qtutils-0.1.4/bin\:/nix/store/83clm3iscfyi4prrar8rbandrmss5sfd-pciutils-3.14.0/bin\:/nix/store/b6wz03kpkjvn6accwhnw6k6qki628dnx-pkgconf-wrapper-2.4.3/bin\:/nix/store/yzf05jm1mn6idx0bxivqgi25rgr9nadr-ghostty-1.1.3/bin
