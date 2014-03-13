class GpsStatistic < ActiveRecord::Base
  belongs_to :car

  has_one :location, as: :locationable, dependent: :destroy

  accepts_nested_attributes_for :location

  validates_presence_of :kmh

  validates_associated :location
  validates_presence_of :location
end
