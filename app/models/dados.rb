class Dados < ActiveRecord::Base
  def self.conn
    ActiveRecord::Base.establish_connection(
      :adapter  => "postgresql",
      :host     => "localhost",
      :database => "dados",
      :user     => "postgres",
      :password => "city9"
    ).connection
  end
end
