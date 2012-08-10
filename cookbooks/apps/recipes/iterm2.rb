include_recipe "iterm2::default"

# Install ASCII ttf font with old school high ascii chars, perfect for
# txt irc clients.
cookbook_file File.expand_path("~/Library/Fonts/ASCII.ttf")
