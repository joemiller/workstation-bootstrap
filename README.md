OSX Bootstrap with Chef
=======================

This is a repo I use for setting up a new mac using chef-solo. It is
based off of Ben Bleything's repo - https://github.com/bleything/bootstrap but
has significant inspiration and code from Justin Timberman (@jtimberman)'s
work in this area as well.

It's fairly opionated but I tried to make it configurable too. Modify to suit
your tastes.

I use the Chef omnibus/universal installer.

This is not a fully automated chef run. It may prompt you for things
(such as sudo passwd). It can probably be made to run fully-automated with
minimal effort.


Using
-----
- Install ‘Command Line Tools for OSX <version>’ from http://developer.apple.com/downloads
  (requires free apple ID login) for the C compiler. Homebrew will need this.
  Alternatively you can install XCode and then install the Command Line Tools
  package from within the XCode GUI.

- Install Chef: `curl -L http://www.opscode.com/chef/install.sh | sudo bash`

- Copy `roles/private_settings.rb-example` to `roles/private_settings.rb` and
  edit to suit taste.

- Create your own role in the `roles` directory or use one of the existing files.
  I have a `laptop` and `desktop` role that set things up slightly differently
  for me, but mostly just inherit from the `base` role.

- Create a `config/<name>.json` file or use one that is already there. I try
  to keep these files to the minimum run_list and put the bulk of the data
  into a role.

- Run chef using Rake!  `rake chef dna=my_config` would run chef-solo using the
  `config/myconfig.json` file. Default is `dna=laptop` if not specified.

- Install other things that I have not included in this cookbook, such as:

    * Any apps from the Mac App Store
    * SSH keys, SSL keys, etc.


A Note About Dropbox
--------------------
The `apps::dropbox` recipe will stop the Chef run after installing Dropbox
if it detects that Dropbox is not yet configured. I do this because some of the
other recipes depend on files in my Dropbox. You can disable this if it
doesn't matter in your setup by setting the node attribute
`node[:dropbox][:exit_if_not_configured]` to `false`.


A note about settings
---------------------
OSX settings are applied from the `osx_settings` cookbook. This is a very basic
setup and it simply executes `defaults`. I think this is a quick and simple way
to handle settings and maps directly to various articles you'll find online.
I may move to using @jtimberman's LWRPs for handling these in the future.


TODO / Unfinished
-----------------
* The `expandrive` recipe does not currently install a license if you have one.
* The `expandrive` recipe could manage your sftp bookmarks.
* Manage ssh and ssl keys? Perhaps using the `private_settings.rb` role.
* convert `osx_settings` to use @jtimberman's LWRPs from his `mac_os_x` cookbook?
* More support for various dotfiles I want to install.


Contributions and Thanks
------------------------
This setup uses a lot of great code and ideas from these pioneers in the
osx-workstation-setup-with-chef world:

* Ben Bleything - https://github.com/bleything/bootstrap
* Joshua Timberman (@jtimberman) - https://github.com/jtimberman/workstation-chef-repo


Licenses
--------
The code in this repository is licensed under the Apache 2.0 software license except where noted or applicable.

Author
------
Joe Miller - https://github.com/joemiller

But most of the hardwork was done by the other guys mentioned in the
contributions section!
