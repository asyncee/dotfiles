set -gx fish_greeting
set -gx EDITOR vim

fish_vi_key_bindings

fzf --fish | source

fish_add_path /home/asyncee/.zig
fish_add_path /home/asyncee/development/flutter/bin
fish_add_path /home/asyncee/Android/Sdk/platform-tools

if status is-interactive
    # Commands to run in interactive sessions can go here
end
