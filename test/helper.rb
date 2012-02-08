require 'rubygems'
require 'test/unit'
require 'sqlite3'
require 'filthy'
require 'shoulda-context'

config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
ActiveRecord::Base.establish_connection(config['test'])

ActiveRecord::Base.connection.create_table :movies, :force => true do |table|
  table.column :title, :string
  table.column :director, :string
  table.column :best_boy_grip, :string
end

ActiveRecord::Base.connection.create_table :actors, :force => true do |table|
  table.column :id, :integer
  table.column :name, :string
end

class Movie < ActiveRecord::Base
  
  filthy_attributes :title, :director

end

class Short < Movie
end

class Documentary < Movie
  filthy_attributes :best_boy_grip
end

class Actor < ActiveRecord::Base

end
