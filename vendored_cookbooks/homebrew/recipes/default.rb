execute "fix_usr_local_perms" do
  command "sudo chown -R root:admin /usr/local ; sudo chmod 775 /usr/local"
  not_if { File.writable?('/usr/local') }
end

execute "install homebrew" do
  command "curl -sfL https://github.com/mxcl/homebrew/tarball/master | tar zx -m --strip 1"
  cwd "/usr/local"
  not_if { File.exist? '/usr/local/bin/brew' }
end

package 'git'

execute "update homebrew from github" do
  command "/usr/local/bin/brew update || true"
end
