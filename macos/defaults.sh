#!/usr/bin/env bash
set -euo pipefail

defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write com.apple.dock autohide -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

killall Dock || true
killall Finder || true
