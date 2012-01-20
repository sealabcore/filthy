require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('filthy', '1.0.0') do |p|
  p.description    = "Check if an attribute was changed after the last save."
  p.url            = "http://github.com/sealabcore/filthy"
  p.author         = "Mike Taylor"
  p.email          = "michael.taylor@bookrenter.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = ["sqlite3", "active_record", "active_support", 'test/unit', 'shoulda-context']
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
