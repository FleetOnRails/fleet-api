class Group < ActiveRecord::Base
  has_many :group_user_joins
  has_many :group_car_joins

  has_many :users, through: :group_user_joins
  has_many :cars, through: :group_car_joins

  def is_member?(user)
    self.users.each do |group_member|
      return true if group_member.id == user.id
    end
    false
  end
end
