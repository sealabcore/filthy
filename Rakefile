require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('filthy', '0.1.0') do |p|
  p.description    = "Check if an attribute was changed on the last save."
  p.url            = "http://github.com/sealabcore/filthy"
  p.author         = "Mike Taylor"
  p.email          = "michael.taylor@bookrenter.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
