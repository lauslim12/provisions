#!/bin/bash

##
# macos.sh
#
# Dotfile to set up my personal MacOS's configuration. This is opinionated, and of
# course there might be a thing or two which you could improve for yourself. As an
# exception, this file is not alphabetically sorted.
##

###############################################################################
# Initialization                                                              #
###############################################################################

# Close any open System Preferences panes, to prevent them from overriding settings we’re about to change.
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Greet Mac user.
echo "Hello $(whoami)! Let's start configuring the defaults!"

# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window.
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

###############################################################################
# Screen                                                                      #
###############################################################################

# Automatically hide and show the Dock.
defaults write com.apple.dock autohide -bool true

# Save screenshots to the desktop.
defaults write com.apple.screencapture location -string "$HOME/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF).
defaults write com.apple.screencapture type -string "png"

# Show battery percentage.
defaults write com.apple.menuextra.battery ShowPercent YES

###############################################################################
# Trackpad                                                                    #
###############################################################################

# Enable tap to click for this user and for the login screen.
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

###############################################################################
# Finder                                                                      #
###############################################################################

# Allow quitting via ⌘ + Q; doing so will also hide desktop icons.
defaults write com.apple.finder QuitMenuItem -bool true

# Show 'Macintosh HD' on Desktop.
defaults write com.apple.finder ShowHardDrivesOnDesktop -boolean true

# Show status bar.
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar.
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting by name.
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default.
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Set list view as the default view mode. Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`.
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Avoid creating '.DS_Store' files on network or USB volumes.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

###############################################################################
# iTerm2                                                                      #
###############################################################################

# Enable Secure Keyboard Entry in Terminal.app.
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# Don't display the prompt when quitting iTerm.
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

###############################################################################
# Finishing                                                                   #
###############################################################################

# Finish bootstrapping.
echo "$(whoami), we have finished setting up your Mac. Please remember that some changes might require a restart."
