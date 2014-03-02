class UserGroup < ActiveRecord::Base
  #include FleetOnRails::Access

  belongs_to :user
  belongs_to :group

  scope :owners, -> { where(group_access: 30) }
  scope :drivers, -> { where(group_access: 20) }
  scope :reporters, -> { where(group_access: 10) }

  validates :user_id, presence: true
  validates :group_id, presence: true
  validates :user_id, uniqueness: { scope: [:group_id], message: 'already exists in group'}
end
