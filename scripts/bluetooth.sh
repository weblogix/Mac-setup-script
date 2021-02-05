#!/bin/bash

# bluetooth coexistence 
# https://gist.github.com/xbeta/e60fddd012e95202bbbe

sudo defaults write /Library/Preferences/com.apple.airport.bt.plist bluetoothCoexMgmt Hybrid
