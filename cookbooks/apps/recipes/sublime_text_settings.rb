# setup symlinks to shared config dir on dropbox. If you don't do this too
# then you should not include this recipe in your role.
directory File.expand_path("~/Library/Application Support/Sublime Text 2")

link File.expand_path("~/Library/Application Support/Sublime Text 2/Installed Packages") do
  to File.expand_path("~/Dropbox/sublime-text2-settings/Installed Packages")
end

link File.expand_path("~/Library/Application Support/Sublime Text 2/Pristine Packages") do
  to File.expand_path("~/Dropbox/sublime-text2-settings/Pristine Packages")
end

link File.expand_path("~/Library/Application Support/Sublime Text 2/Packages") do
  to File.expand_path("~/Dropbox/sublime-text2-settings/Packages")
end
