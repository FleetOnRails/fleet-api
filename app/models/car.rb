class Car < ActiveRecord::Base
  belongs_to :owner, polymorphic: true

  has_many :diagnostic_statistics, dependent: :destroy
  has_many :diagnostic_faults, dependent: :destroy
  has_many :gps_statistics, dependent: :destroy
  has_many :service_records, dependent: :destroy
  has_many :documents, as: :documentable, dependent: :destroy
  has_many :fuel_entries, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  validates_presence_of :make
  validates_presence_of :model
  validates_presence_of :registration

  validates_uniqueness_of :registration
end
