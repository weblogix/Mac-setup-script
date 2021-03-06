#!/bin/bash

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew install $(cat brew_packages.txt)
brew install --cask \
google-chrome \
visual-studio-code \
onyx \
appcleaner \