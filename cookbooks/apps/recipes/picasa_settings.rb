# setup symlinks to shared config dir on dropbox. If you don't do this too
# then you should not include this recipe in your role.
directory File.expand_path("~/Library/Application Support/Google")

link File.expand_path("~/Library/Application Support/Google/Picasa3") do
  to File.expand_path("~/Dropbox/PicasaSettings/Picasa3/")
end

link File.expand_path("~/Library/Preferences/com.google.picasa.plist") do
  to File.expand_path("~/Dropbox/PicasaSettings/com.google.picasa.plist")
end
