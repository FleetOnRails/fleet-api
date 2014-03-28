class Reminder < ActiveRecord::Base
  belongs_to :car

  validates_presence_of :date
  validates_presence_of :odometer
  validates_presence_of :reminder_type
  validates_presence_of :description
end
