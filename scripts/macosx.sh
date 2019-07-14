#!/bin/sh

# System tweaks
echo "Installling Mac OS Tweaks"

# Finder

# Set `${HOME}` as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles TRUE

# Show Status bar in Finder （ステータスバーを表示）
defaults write com.apple.finder ShowStatusBar -bool true

# Show Path bar in Finder （パスバーを表示）
defaults write com.apple.finder ShowPathbar -bool true

# Show the ~/Library directory （ライブラリディレクトリを表示、デフォルトは非表示）
chflags nohidden ~/Library


# Avoid creating `.DS_Store` files on network volumes （ネットワークディスクで、`.DS_Store` ファイルを作らない）
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true


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

# To make the dock hide and show instantly (if set to auto-hide)
# https://howchoo.com/g/mmuwzwnmmzn/make-the-dock-autohide-and-show-instantly-in-os-x
defaults write com.apple.Dock autohide-delay -float 0.0001; killall Dock

# Disable the animation when you sending and replying an e-mail
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true

# Safari

# Disable the standard delay in rendering a Web page.
defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.25

# Prevent Safari from Opening Safe Files Automatically
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Enable the `Develop` menu and the `Web Inspector` （開発メニューを表示）
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true

# Enable `Debug` menu （メニュー → デバッグを表示）
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Show the full URL in the address bar (note: this will still hide the scheme)
# アドレスバーに完全なURLを表示
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Add a context menu item for showing the `Web Inspector` in web views
# コンテキストメニューにWebインスペクタを追加
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Show Safari's Status Bar （ステータスバーを表示）
defaults write com.apple.Safari ShowStatusBar -bool true

# Don't remember passwords （パスワードを自動入力・記録しない）
defaults write com.apple.Safari AutoFillPasswords -bool false


# Email

# Stop Full Names from Copying with Email Addresses in OS X Mail
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Textedit

# Use plain text as default format in TextEdit
defaults write com.apple.TextEdit RichText -int 0

# Photos

# Stop Photos from opening automatically
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Allow Apps downloaded from Anywhere
sudo spctl --master-disable


# Automatically quit the printer app once the print jobs are completed
# 印刷が終了したら、自動的にプリンターアプリを終了する
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true



# Restart Finder
killall Finder
