# this cookbook does not actually manage dotfiles. instead it downloads
# my dotfile git repo and runs the idempotent install script contained within
# it

dotfile_dir = "#{ENV['HOME']}/.dotfiles"

git dotfile_dir do
  repository "git://github.com/joemiller/dotfiles.git"
  reference "master"
  action :sync
end

execute "install_dotfiles" do
  command "./install -n"
  cwd dotfile_dir
end
