class UserGroup < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  scope :managers, -> { where(group_access: MANAGER) }
  scope :owners, -> { where(group_access: OWNER) }
  scope :drivers, -> { where(group_access: DRIVER) }
  scope :reporters, -> { where(group_access: REPORTER) }

  validates_presence_of :user_id
  validates_presence_of :group_id
  validates_presence_of :group_access
  validates :user_id, uniqueness: {scope: [:group_id], message: 'already exists in group'}
end
