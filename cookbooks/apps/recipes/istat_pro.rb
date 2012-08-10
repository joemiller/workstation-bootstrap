# this recipe installs the iStat Pro Dashboard widget.
#
# the version is hardcoded because the authors don't seem to have plans to
# release any new updates.
#
# the recipe will also attempt to patch the widget for Mountain Lion compat.

remote_file "istat_pro_4.92.zip" do
  source "http://s3.amazonaws.com/bjango/files/istatpro/istat_pro_4.92.zip"
  path "#{Chef::Config[:file_cache_path]}/istat_pro.zip"
  not_if { ::File.directory? File.expand_path("~/Library/Widgets/iStat Pro.wdgt/") }
end

execute "unzip istat pro" do
  unzip_path = File.expand_path("~/Library/Widgets")
  command "unzip -d #{unzip_path} #{Chef::Config[:file_cache_path]}/istat_pro.zip"
  not_if { ::File.directory? File.expand_path("~/Library/Widgets/iStat Pro.wdgt/") }
end

# simple patch for mountain lion compat
execute "patch istat pro for mountain lion Wide.js" do
  command "perl -p -i -e 's/PID\|\$1/PID | \$1/g' ~/Library/Widgets/iStat\ Pro.wdgt/Wide.js"
end

execute "patch istat pro for mountain lion Tall.js" do
  command "perl -p -i -e 's/PID\|\$1/PID | \$1/g' ~/Library/Widgets/iStat\ Pro.wdgt/Tall.js"
end
