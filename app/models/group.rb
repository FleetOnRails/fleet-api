class Group < ActiveRecord::Base
  has_and_belongs_to_many :users

  def is_member?(user)
    self.users.each do |group_member|
      return true if group_member.id == user.id
    end
    false
  end
end
