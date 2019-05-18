#!/bin/sh
INSTALL_DIR=$HOME/Applications/openpyn-nordvpn

brew install python3 wget openvpn
sudo brew services start openvpn

git clone https://github.com/jotyGill/openpyn-nordvpn.git $INSTALL_DIR
cd $INSTALL_DIR
git pull
sudo pip3 install --upgrade .