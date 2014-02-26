class Car < ActiveRecord::Base
  belongs_to :owner, polymorphic: true

  has_many :diagnostic_statistics, dependent: :destroy
  has_many :diagnostic_faults, dependent: :destroy
  has_many :gps_statistics, dependent: :destroy
  has_many :service_records, dependent: :destroy
  has_many :documents, as: :documentable, dependent: :destroy
end
