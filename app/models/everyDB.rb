class everyDB < ActiveRecord::Base
  ActiveRecord::Base.establish_connection(
    :adapter  => "postgresql",
    :host     => "localhost",
    :database => "everydayvis_development"
    #:user     => "postgres",
    #:password => "city9"
  ).connection
  self.abstract_class = true
end
