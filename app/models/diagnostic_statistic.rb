class DiagnosticStatistic < ActiveRecord::Base
  belongs_to :car

  validates_presence_of :kmh
  validates_presence_of :rpm
  validates_presence_of :l100km
end
