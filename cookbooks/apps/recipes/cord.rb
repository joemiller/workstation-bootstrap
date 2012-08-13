# this recipe installs the CoRD (RDP client)
#
remote_file "cord.zip" do
  source "http://downloads.sourceforge.net/project/cord/cord/0.5.7/CoRD_0.5.7.zip?r=http%3A%2F%2Fcord.sourceforge.net%2F&ts=1344827595&use_mirror=iweb"
  path "#{Chef::Config[:file_cache_path]}/cord.zip"
  not_if { ::File.directory? File.expand_path("/Applications/CoRD.app") }
end

execute "unzip cord" do
  command "unzip -d /Applications #{Chef::Config[:file_cache_path]}/cord.zip"
  not_if { ::File.directory? File.expand_path("/Applications/CoRD.app") }
end

# sync your cord *.rdp files!
remote_directory File.expand_path("~/Library/Application Support/CoRD/Servers") do
  source "cord/Servers"
end
