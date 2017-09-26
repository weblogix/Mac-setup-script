brew install zsh zsh-completions
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
