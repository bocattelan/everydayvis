class Smada < ActiveRecord::Base
  ActiveRecord::Base.establish_connection(
    :adapter  => "postgresql",
    :host     => "localhost",
    :database => "sensordata",
    :user     => "postgres",
    :password => "city9"
  ).connection
  self.abstract_class = true
end
