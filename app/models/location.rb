class Location < ActiveRecord::Base
  #ActiveRecord::Base.establish_connection DBCONF
    ActiveRecord::Base.establish_connection(
    :adapter  => "postgresql",
    :host     => "localhost",
    :database => "everydayvis_development",
    :encoding => "unicode"
  ).connection

  belongs_to :person
end
