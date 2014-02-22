class Car < ActiveRecord::Base
  has_many :group_car_joins
  has_many :user_car_joins

  has_many :users, through: :user_car_joins
  has_many :groups, through: :group_user_joins
end
