class Group < ActiveRecord::Base
  include GroupConcern

  has_many :cars, as: :owner, dependent: :destroy
  has_many :destinations, as: :destinationable, dependent: :destroy
  has_many :vendors, as: :venderable, dependent: :destroy

  has_many :user_groups
  has_many :users, through: :user_groups

  def is_member?(user)
    self.users.each do |group_member|
      return true if group_member.id == user.id
    end
    false
  end

  def is_owner?(user)
    self.user_groups.owners.each do |user_groups|
      return true if user_groups.user_id == user.id
    end
    false
  end

  def add_user(user, group_access)
    self.user_groups.create(user_id: user.id, group_access: group_access)
  end

  def add_owner(user)
    self.add_user(user, OWNER)
  end
end
