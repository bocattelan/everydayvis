class User < everyDB

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_one :person, dependent: :destroy

end
