class UserGroup < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  scope :owners, -> { where(group_access: OWNER) }
  scope :drivers, -> { where(group_access: DRIVER) }
  scope :reporters, -> { where(group_access: REPORTER) }

  validates :user_id, presence: true
  validates :group_id, presence: true
  validates :user_id, uniqueness: { scope: [:group_id], message: 'already exists in group'}
end
