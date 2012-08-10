name "desktop"
description "role for desktop setups"

run_list %w[
  role[base]
  recipe[osx_settings::desktop]
]

