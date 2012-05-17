require "rubygems"
require "lib/dmamp/version.rb"
require "rake"
require "echoe"

Echoe.new('dmamp', '0.0.1') do |p|
  p.description   = "Templating for puppet module patterns"
  p.url           = "http://github.com/oholiab/DMAMP"
  p.author        = "Matt Carroll"
  p.email         = "oholiab@gmail.com"
  p.version       = DMAMP::VERSION
  p.development_dependencies = []
end

task :bump do
  system 'vi lib/dmamp/version.rb'
end

task :bumplog do
  version = "\nv#{DMAMP::VERSION}. CHANGEME"
  system "echo \"#{version}\" >> CHANGELOG && vi CHANGELOG"
end
