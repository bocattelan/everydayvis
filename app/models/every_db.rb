class EveryDb < ActiveRecord::Base
  establish_connection(
    :adapter  => "postgresql",
    :host     => "localhost",
    :database => "everydayvis_development",
    :user     => "postgres"
  ).connection
  self.abstract_class = true
end
