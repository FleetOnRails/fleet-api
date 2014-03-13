class Destination < ActiveRecord::Base
  belongs_to :destinationable, polymorphic: true

  has_one :location, as: :locationable, dependent: :destroy

  accepts_nested_attributes_for :location

  validates_presence_of :name

  validates_associated :location
  validates_presence_of :location
end
