# i only auto-hide the Dock on my laptops where screen real estate is at a premium. *shrug*
execute "defaults write com.apple.dock autohide -bool true"
execute "killall Dock"
