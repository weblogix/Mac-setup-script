#!/bin/bash

# if [ "$EUID" -ne 0 ]
#   then echo "Please run as root.  Some commands require root priviledges."
#   exit
# fi
cd scripts
# Mac OS tweaks
./macosx.sh

# Apps + Packages (Also installs Xcode Command Line Tools)
./homebrew.sh

# Mac OS SSH Keychain fix
# https://github.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain
sudo cp ./ssh.add.a.plist /Library/LaunchAgents/

# Local Environment
#scripts/xcode.sh
./zsh.sh
./git.sh

# Web Dev

#scripts/composer.sh
#scripts/dev_dns.sh

cd ..
source ~/.zshrc