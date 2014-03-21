class GpsStatistic < ActiveRecord::Base
  belongs_to :car

  validates_presence_of :kmh
  validates_presence_of :latitude
  validates_presence_of :longitude
end
