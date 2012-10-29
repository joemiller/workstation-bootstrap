# installs Xquartz (X.Org for osx). necessary on Mountain Lion or newer:
# http://support.apple.com/kb/HT5293
#

include_recipe 'dmg'

dmg_package 'XQuartz' do
  type        'pkg'
  volumes_dir "XQuartz-#{node[:xquartz][:version]}"
  source      node[:xquartz][:url]
  checksum    node[:xquartz][:checksum]
end
