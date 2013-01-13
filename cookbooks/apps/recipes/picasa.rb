include_recipe 'dmg'

dmg_package 'Picasa' do
  volumes_dir "Picasa #{node.picasa.version}"
  source node.picasa.url
  checksum node.picasa.checksum
  dmg_name node.picasa.dmg_name
end
