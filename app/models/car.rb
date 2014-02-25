class Car < ActiveRecord::Base
  belongs_to :owner, polymorphic: true

  has_many :diagnostic_statistics
  has_many :diagnostic_faults
  has_many :gps_statistics
  has_many :documents, as: :documentable
end
