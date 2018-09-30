#!/bin/bash

# if [ "$EUID" -ne 0 ]
#   then echo "Please run as root.  Some commands require root priviledges."
#   exit
# fi

# Apps + Packages (Also installs Xcode Command Line Tools)
scripts/homebrew.sh

# Mac OS SSH Keychain fix
# https://github.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain
sudo cp ./scripts/ssh.add.a.plist /Library/LaunchAgents/

# Local Environment
#scripts/xcode.sh
scripts/zsh.sh
scripts/git.sh

# Web Dev

#scripts/composer.sh
#scripts/dev_dns.sh


source ~/.zshrc