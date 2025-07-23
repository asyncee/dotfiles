if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

set EDITOR nvim
set VISUAL nvim

set -g fish_key_bindings fish_vi_key_bindings

fish_add_path /opt/nvim/bin

abbr bat batcat

set -x FZF_DEFAULT_COMMAND 'fdfind --type f --strip-cwd-prefix --hidden --follow --exclude .git'
set -x FZF_CTRL_T_COMMAND "fdfind $dir --type f --strip-cwd-prefix --hidden --follow --exclude .git"
set -x FZF_ALT_C_COMMAND "fdfind $dir --type d --strip-cwd-prefix --hidden --follow --exclude .git"

fzf --fish | source

fish_add_path /home/asyncee/.zig
fish_add_path /home/asyncee/development/flutter/bin
fish_add_path /home/asyncee/Android/Sdk/platform-tools

