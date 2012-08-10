# download and install Expandrive (sshfs app)
#
# this recipe does not currently support installing Expandrive license

remote_file "expandrive.zip" do
  source node[:expandrive][:url]
  path "#{Chef::Config[:file_cache_path]}/expandrive.zip"
  not_if { ::File.directory? "/Applications/ExpanDrive.app" }
end

execute "unzip ExpanDrive" do
  command "unzip -d /Applications #{Chef::Config[:file_cache_path]}/expandrive.zip"
  not_if { ::File.directory? "/Applications/ExpanDrive.app" }
end
