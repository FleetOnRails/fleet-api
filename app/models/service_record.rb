class ServiceRecord < ActiveRecord::Base
  belongs_to :car

  has_many :documents, as: :documentable, dependent: :destroy
  has_one :location, as: :locationable, dependent: :destroy

  accepts_nested_attributes_for :location

  validates_presence_of :odometer_reading
  validates_presence_of :technician
  validates_presence_of :description

  validates_associated :location
  validates_presence_of :location
end
