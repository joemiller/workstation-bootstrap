# Login to 

include_recipe 'dmg'

dmg_package 'Skype' do
  #dmg_name 'google_chrome'
  #source   'http://dl.google.com/chrome/mac/dev/GoogleChrome.dmg'
  source 'http://www.skype.com/go/getskype-macosx'
end
