class Person < ActiveRecord::Base

  belongs_to :user

  has_many :days, dependent: :destroy

  scope :with_user, -> { where("user_id IS NOT NULL") }
  scope :without_user, -> { where("user_id IS NULL") }

  def day(date)
    days.where(date: date).first
  end

end
