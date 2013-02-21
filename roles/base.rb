name "base"
description "base role for workstation setup"

run_list %w[
  role[private_settings]

  recipe[apps::dropbox]
  recipe[apps::chrome]
  recipe[apps::skype]
  recipe[apps::alfred]
  recipe[apps::vlc]
  recipe[apps::iterm2]
  recipe[apps::expandrive]
  recipe[apps::1password]
  recipe[apps::istat_pro]
  recipe[apps::sublime_text]
  recipe[apps::sublime_text_settings]
  recipe[apps::tunnelblick]
  recipe[apps::cord]
  recipe[apps::keepassx]
  recipe[apps::chicken]
  recipe[apps::xquartz]
  recipe[apps::picasa]
  recipe[apps::picasa_settings]

  recipe[homebrew]
  recipe[homebrew::environment]
  recipe[homebrew::taps]
  recipe[homebrew::packages]

  recipe[rvm]
  recipe[rvm::rubies]

  recipe[dotfiles]

  recipe[osx_settings]
  recipe[osx_settings::keyboard_shortcuts]
]

default_attributes({

  "iterm2" => {
    "version" => "-1_0_0_20120726",
    "checksum" => "19538b6be5cb6f97e34aa729983a90ebc7a0e7ea"
  },

  "one_password" => {
    # better to put name and key in the 'private_settings.rb' role
    # "name" => "Some Guy",
    # "key" => "LIC-EN-SE",
    "version" => "3.8.12",
    "checksum" => "9e7ad33a876ce9a5d1a63438d95619ca0e3240af"
  },

  "homebrew" => {
    "packages" => %w[
      wget
      git-flow
      mysql
      redis
      nmap
      p7zip
      parallel
      pidof
      pkg-config
      readline
      s3cmd
      tmux
      unrar
      watch
      bash-completion
      apple-gcc42
      automake
      autoconf
      openconnect
    ],
    # need the `homebrew/dupes` tap for `apple-gcc42`
    "taps" => %w[
      "homebrew/dupes"
    ]
  },

  "rvm" => {
    "rubies" => %w[
      1.9.3
    ]
  }
})
