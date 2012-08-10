#
# ex: rake chef dna=laptop
#

dna = ENV['dna'] || 'laptop'

desc "Runs chef-solo with the given config/<dna>.json"
task :chef do
  config_dir = File.expand_path(File.dirname(__FILE__)) + "/config"
  fail "config/#{dna}.json does not exist" unless File.exists?( config_dir + "/#{dna}.json" )
  sh "chef-solo -c #{config_dir}/solo.rb -j #{config_dir}/#{dna}.json"
end

task :default => [:chef]
