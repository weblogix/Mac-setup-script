# DNSmasq for local dev (https://weblogix.ca/local-development/use-any-domains-for-local-development-with-dnsmasq-on-osx-10-1110-12/)
brew install dnsmasq
DNSMAS_CONF="/usr/local/etc/dnsmasq.conf"

sed -ie 's/#listen-address=/listen-address=127.0.0.1/g' $DNSMAS_CONF
sed -ie 's/#address=\/double-click\.net\/127.0.0.1/address=\/dev\/127.0.0.1/g' $DNSMAS_CONF
sudo cp $(brew list dnsmasq| grep /homebrew.mxcl.dnsmasq.plist$) /Library/LaunchDaemons/
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
sudo mkdir -v /etc/resolver
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'