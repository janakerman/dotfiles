#!/usr/bin/env bash
set -euo pipefail

echo "Applying macOS defaults..."

#######################################
# Keyboard
#######################################

# Faster key repeat (good for coding)
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable smart quotes and dashes (code > typography)
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

#######################################
# Finder
#######################################

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show hidden files (optional — comment out if you don’t want this)
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show full POSIX path in Finder title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top
defaults write com.apple.finder _FXSortFoldersFirst -bool true

#######################################
# Dock
#######################################

# Auto-hide Dock
defaults write com.apple.dock autohide -bool true

# Remove Dock show delay
defaults write com.apple.dock autohide-delay -float 0

# Faster Dock animation
defaults write com.apple.dock autohide-time-modifier -float 0.15

#######################################
# Trackpad / Mouse
#######################################

# Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

#######################################
# Misc
#######################################

# Disable .DS_Store on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#######################################
# Restart affected services
#######################################

killall Dock || true
killall Finder || true

echo "Done."