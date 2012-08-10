# password protected screensaver
execute "defaults write com.apple.screensaver askForPassword -int 1"

# password protected screensaver delay
execute "defaults write com.apple.screensaver askForPasswordDelay -int 10"

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
execute "defaults write NSGlobalDomain AppleKeyboardUIMode -int 3"

# change scroll wheel (disable 'natural scroll') (re-login to take effect)`
execute "defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false"

# ‘Disable the “reopen windows when logging back in” option’
execute "defaults write com.apple.loginwindow TALLogoutSavesState -bool false"
execute "defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false"

# ‘Disable the warning before emptying the Trash’
execute "defaults write com.apple.finder WarnOnEmptyTrash -bool false"

# ‘Avoid creating .DS_Store files on network volumes’
execute "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true"

# ‘Disable the warning when changing a file extension’
execute "defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false"

# "Display full POSIX path as Finder window title"
execute "defaults write com.apple.finder _FXShowPosixPathInTitle -bool true"

# "Automatically open a new Finder window when a volume is mounted"
execute "defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true"
execute "defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true"
execute "defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true"

# "Enable AirDrop over Ethernet and on unsupported Macs running Lion"
execute "defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true"

# "Disable press-and-hold for keys in favor of key repeat"
execute "defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false"

# "Set a blazingly fast keyboard repeat rate"
execute "defaults write NSGlobalDomain KeyRepeat -int 0.92"

# "Set a shorter Delay until key repeat"
execute "defaults write NSGlobalDomain InitialKeyRepeat -int 12"

# "Show Path bar in Finder"
execute "defaults write com.apple.finder ShowPathbar -bool true"

# "Show Status bar in Finder"
execute "defaults write com.apple.finder ShowStatusBar -bool true"

# "Show all filename extensions in Finder"
execute "defaults write NSGlobalDomain AppleShowAllExtensions -bool true"

# “show all files”
execute "defaults write com.apple.finder AppleShowAllFiles -bool YES"

# "Enable subpixel font rendering on non-Apple LCDs"
execute "defaults write NSGlobalDomain AppleFontSmoothing -int 2"

# “show ~/Library”
execute "chflags nohidden ~/Library"

# “disable re-open windows in Preview and QuickTime”
execute "defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -bool false"
execute "defaults write com.apple.QuickTimePlayerX NSQuitAlwaysKeepsWindows -bool false"

# enable 'app expose' with 3 finger swipe down
execute "defaults write com.apple.dock showAppExposeGestureEnabled -bool true"

# disable 'Show Dashboard as Space' in System Preferences > Mission Control
# restores pre-lion behavior
execute "defaults write com.apple.dock dashboard-in-overlay -bool true"

# Set Apple Magic Mouse button 1 to Primary click and button 2 to Secondary click.
execute "defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string TwoButton"

