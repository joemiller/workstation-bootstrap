# Install Chicken of the VNC

include_recipe 'dmg'

dmg_package 'Chicken' do
  volumes_dir "Chicken"
  dmg_name    "Chicken-#{node[:chicken][:version]}"
  source      node[:chicken][:url]
  checksum    node[:chicken][:checksum]
end
