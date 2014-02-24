class Group < ActiveRecord::Base
  has_many :cars, as: :drivable

  has_many :user_groups
  has_many :users, through: :user_groups

  def is_member?(user)
    self.users.each do |group_member|
      return true if group_member.id == user.id
    end
    false
  end
end
