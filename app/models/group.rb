class Group < ActiveRecord::Base
  #include GroupConcern

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
end
