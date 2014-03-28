class Car < ActiveRecord::Base
  belongs_to :owner, polymorphic: true

  has_many :diagnostic_faults, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :documents, as: :documentable, dependent: :destroy
  has_many :fuel_entries, dependent: :destroy

  has_many :diagnostic_statistics, dependent: :destroy
  has_many :gps_statistics, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  validates_presence_of :make
  validates_presence_of :model
  validates_presence_of :registration

  validates_uniqueness_of :registration

  LIMIT = 30000

  def add_diagnostic_statistic(diagnostic_statistic)
    if diagnostic_statistics.length > LIMIT
      diagnostic_statistics.limit(100).each { |record| record.destroy! }
    end

    diagnostic_statistics << diagnostic_statistic
  end

  def add_gps_statistic(gps_statistic)
    if gps_statistics.size > LIMIT
      gps_statistics.limit(100).each { |record| record.destroy! }
    end

    gps_statistics << gps_statistic
  end
end
