class Car < ActiveRecord::Base
  has_many :group_car_joins
  has_many :user_car_joins

  has_many :users, through: :user_car_joins
  has_many :groups, through: :group_car_joins

  def is_driver?(user)
    self.users.each do |car_driver|
      return true if car_driver.id == user.id
    end
    false
  end
end
