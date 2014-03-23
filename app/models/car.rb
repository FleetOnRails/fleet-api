class Car < ActiveRecord::Base
  belongs_to :owner, polymorphic: true

  has_many :diagnostic_faults, dependent: :destroy
  has_many :service_records, dependent: :destroy
  has_many :documents, as: :documentable, dependent: :destroy
  has_many :fuel_entries, dependent: :destroy

  has_many :diagnostic_statistics, dependent: :destroy, before_add: :limit_diagnostic_statistics
  has_many :gps_statistics, dependent: :destroy, before_add: :limit_gps_statistics

  mount_uploader :avatar, AvatarUploader

  validates_presence_of :make
  validates_presence_of :model
  validates_presence_of :registration

  validates_uniqueness_of :registration

  private

  LIMIT = 30000

  def limit_gps_statistics
    if gps_statistics.size >= LIMIT
      first_thousand = self.gps_statistics.limit(1000)
      first_thousand.each { |record| record.destroy!}
    end
  end

  def limit_diagnostic_statistics
    if things.size >= LIMIT
      first_thousand = self.diagnostic_statistics.limit(1000)
      first_thousand.each { |record| record.destroy!}
    end
  end
end
