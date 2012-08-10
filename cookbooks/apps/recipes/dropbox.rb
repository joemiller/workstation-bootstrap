#
# Cookbook Name:: apps
# Recipe:: dropbox
#
# Copyright 2011, Ben Bleything <ben@bleything.net>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'dmg'

dmg_package 'Dropbox' do
  volumes_dir 'Dropbox Installer'
#  source      'http://www.dropbox.com/download?plat=mac'
  source      'http://dl-web.dropbox.com/u/17/b/Dropbox%201.4.12.dmg'
  checksum    'a951569e5369076c8d717ec5d28604b5efa4b09a'
end

if node[:dropbox][:exit_if_not_configured]
  ruby_block 'exit_if_dropbox_not_configured' do
    block do
      raise "\n\nYou should run Dropbox and configure it before proceeding. Run chef again when done\n\n"
    end
    not_if { File.exists?(File.expand_path("~/.dropbox")) }
  end
end
