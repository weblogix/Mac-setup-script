#!/bin/bash

# bluetooth coexistence 
# https://gist.github.com/xbeta/e60fddd012e95202bbbe
# Can cause issues with bluetooth audio latency
#sudo defaults write /Library/Preferences/com.apple.airport.bt.plist bluetoothCoexMgmt Hybrid

# Enable AptX codec for bluetooth
sudo defaults write bluetoothaudiod "Enable AptX codec" -bool true
sudo defaults write bluetoothaudiod "Enable AAC codec" -bool false