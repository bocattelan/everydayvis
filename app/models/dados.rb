class Dados < ActiveRecord::Base
	self.table_name = "data"
  ActiveRecord::Base.establish_connection(
    :adapter  => "postgresql",
    :host     => "localhost",
    :database => "sensordata",
    :user     => "postgres",
    :password => "city9"
  ).connection
  # .connection NAO SEI SE PRECISA, TE CUIDA!

end
