class Group < ActiveRecord::Base
  include GroupConcern

  has_many :cars, as: :owner, dependent: :destroy
  has_many :destinations, as: :destinationable, dependent: :destroy
  has_many :vendors, as: :venderable, dependent: :destroy

  has_many :user_groups
  has_many :users, through: :user_groups
end
