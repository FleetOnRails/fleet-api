class GpsStatistic < ActiveRecord::Base
  belongs_to :car

  has_one :location, as: :locationable, dependent: :destroy

  accepts_nested_attributes_for :location
end
