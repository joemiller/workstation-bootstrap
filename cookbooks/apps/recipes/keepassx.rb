
include_recipe 'dmg'

dmg_package 'KeePassX' do
  volumes_dir "KeePassX-#{node[:keepassx][:version]}"
  source    node[:keepassx][:url]
  checksum  node[:keepassx][:checksum]
end
