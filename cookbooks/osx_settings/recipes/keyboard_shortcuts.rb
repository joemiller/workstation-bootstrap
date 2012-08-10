# this recipe will install a new "~/Library/Preferences/com.apple.symbolichotkeys.plist"
# file for the current user.
#
# I believe this is how OSX handles keyboard shortcuts set in system preferences.
# The values inside the file are not at all intuitive so this recipe just replaces
# the whole file.
#
# if anyone knows a better way to individual set keyboard shortcuts, please
# let me know.
#

# Here are my keyboard shortcuts that are present in the included plist file:
#
# - Keyboard shortcut “Control-#” to switch desktops
#   System Preferences > Keyboard > Keyboard Shortcuts > Mission Control > enable: switch to desktop 1 = ^1
#
# - Make F5 key show all windows of current foreground application:
#   System Preferences > Mission Control > Application Windows:  F5
#

mac_os_x_plist_file "com.apple.symbolichotkeys.plist"
