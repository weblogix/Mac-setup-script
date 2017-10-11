#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root.  Some commands require root priviledges."
  exit
fi


export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'


# System tweaks
echo "${COLOR_RED} Installling Mac OS Tweaks"

# Show hidden files
defaults write com.apple.Finder AppleShowAllFiles true

# Enable Text Selection in Quick Look Windows
defaults write com.apple.finder QLEnableTextSelection -bool TRUE;killall Finder

# Enable the expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Disable Gatekeeper
sudo spctl --master-disable


# Mouse

# Disable Natural Scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Disable mouse pointer acceleration
defaults write .GlobalPreferences com.apple.mouse.scaling -1

# Disable mouse wheel acceleration
defaults write .GlobalPreferences com.apple.scrollwheel.scaling -1

# Dock
# Remove All Default Icons from the Dock
defaults delete com.apple.dock persistent-apps
defaults delete com.apple.dock persistent-others


# Performance / Fancy Animations

# Disable animations when opening and closing windows.
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Disable animations when opening a Quick Look window.
defaults write -g QLPanelAnimationDuration -float 0

# Accelerated playback when adjusting the window size (Cocoa applications).
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Disable animation when opening the Info window in Finder (cmd⌘ + i).
defaults write com.apple.finder DisableAllAnimations -bool true

# Disable animations when you open an application from the Dock.
defaults write com.apple.dock launchanim -bool false

# Make all animations faster that are used by Mission Control.
defaults write com.apple.dock expose-animation-duration -float 0.1

# Disable the delay when you hide the Dock
defaults write com.apple.Dock autohide-delay -float 0

# Disable the animation when you sending and replying an e-mail
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true

# Safari

# Disable the standard delay in rendering a Web page.
defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.25

# Prevent Safari from Opening Safe Files Automatically
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Email

# Stop Full Names from Copying with Email Addresses in OS X Mail
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Textedit

# Use plain text as default format in TextEdit
defaults write com.apple.TextEdit RichText -int 0

# Photos

# Stop Photos from opening automatically
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true


# Restart Finder
killall Finder




# Tools
# Install Xcode Command Line Tools (For macOS High Sierra 10.13)

softwareupdate -i 'Command Line Tools (macOS High Sierra versio`n 10.13) for Xcode-9.0' --verbose


# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew install $(cat brew_packages.txt)



# Scripts

sh scripts/zsh.sh
sh scripts/composer.sh
sh scripts/dev_dns.sh
sh scripts/git.sh

