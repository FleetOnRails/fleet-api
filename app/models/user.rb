class User < ActiveRecord::Base
  include UserConcern

  has_many :cars, as: :owner, dependent: :destroy
  has_many :vendors, as: :venderable, dependent: :destroy
  has_one :avatar, as: :avatarable, dependent: :destroy

  has_many :user_groups
  has_many :groups, through: :user_groups
end
