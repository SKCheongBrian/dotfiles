fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cabal/bin
fish_add_path $HOME/.ghcup/bin

set -gx PNPM_HOME $HOME/.local/share/pnpm
fish_add_path $PNPM_HOME
fish_add_path $PNPM_HOME/bin

set -gx PLAN9 $HOME/src/plan9port
set -gx PATH $PATH $PLAN9/bin

if set -q SSH_CONNECTION
  set -gx EDITOR vim
else
  set -gx EDITOR nvim
end

if status is-interactive
  oh-my-posh init fish --config $HOME/.config/oh-my-posh/acme.omp.json | source
end

set FNM_PATH "/home/bc/.local/share/fnm"
if [ -d "$FNM_PATH" ]
  set PATH "$FNM_PATH" $PATH
  fnm env --shell fish | source
end

fish_add_path $HOME/.ghcup/bin
fish_add_path $HOME/.cabal/bin
