class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships

  def is_member?(user)
    self.users.each do |group_member|
      return true if group_member.id == user.id
    end
    false
  end
end
