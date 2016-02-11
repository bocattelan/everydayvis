class Dados < ActiveRecord::Base

  ActiveRecord::Base.establish_connection(
    :adapter  => "postgresql",
    :host     => "localhost",
    :database => "sensordata",
    :user     => "postgres",
    :password => "city9"
  ).connection
  # .connection NAO SEI SE PRECISA, TE CUIDA!

end
