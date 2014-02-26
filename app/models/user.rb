class User < ActiveRecord::Base
  include UserConcern

  has_many :cars, as: :owner
  has_many :vendors, as: :venderable

  has_many :user_groups
  has_many :groups, through: :user_groups

  mount_uploader :avatar, AvatarUploader
end
