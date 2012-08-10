name "laptop"
description "role for laptop setups"

run_list %w[
  role[base]
  recipe[osx_settings::laptop]
]
