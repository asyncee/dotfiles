#!/bin/bash
rm -rf "$HOME/bin/limelight_src"
git clone https://github.com/koekeishiya/limelight.git "$HOME/bin/limelight_src"
cd "$HOME/bin/limelight_src"
make
ln -sf "$HOME/.dotfiles/limelight/limelight.plist" "$HOME/Library/LaunchAgents/"
launchctl stop limelight
pkill limelight
launchctl unload -w /Users/asyncee/Library/LaunchAgents/limelight.plist
launchctl load -w /Users/asyncee/Library/LaunchAgents/limelight.plist

