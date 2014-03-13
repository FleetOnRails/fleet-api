class FuelEntry < ActiveRecord::Base
  belongs_to :car

  has_one :location, as: :locationable, dependent: :destroy

  accepts_nested_attributes_for :location

  validates_presence_of :odometer
  validates_presence_of :liters
  validates_presence_of :price
  validates_presence_of :fuel_type
  validates_presence_of :filling_station
  validates_presence_of :filled_tank

  validates_associated :location
  validates_presence_of :location
end
