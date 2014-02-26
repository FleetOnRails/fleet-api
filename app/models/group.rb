class Group < ActiveRecord::Base
  include GroupConcern

  has_many :cars, as: :owner
  has_many :destinations, as: :destinationable
  has_many :vendors, as: :venderable

  has_many :user_groups
  has_many :users, through: :user_groups
end
