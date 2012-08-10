execute "git_config_user_name" do
  action :run
  command "git config --global user.name '#{node[:git_config][:user_name]}'"
  not_if "git config --global user.name"
end

execute "git_config_email" do
  action :run
  command "git config --global user.email '#{node[:git_config][:email]}'"
  not_if "git config --global user.email"
end
