class User < ActiveRecord::Base
  #ActiveRecord::Base.establish_connection DBCONF
    ActiveRecord::Base.establish_connection(
    :adapter  => "postgresql",
    :host     => "localhost",
    :database => "everydayvis_development",
    :encoding => "unicode"
  ).connection

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_one :person, dependent: :destroy

end
