class Gateway < ActiveRecord::Base
  ActiveRecord::Base.establish_connection DBCONF

end
