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

# store server (*.rdp) on a shared folder like Dropbox
if node.cord.attribute?('saved_servers_folder')
  mac_os_x_userdefaults 'savedServersPath' do
    domain 'net.sf.cord'
    key name
    value node.cord.saved_servers_folder
  end
end
