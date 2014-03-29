class Car < ActiveRecord::Base
  belongs_to :owner, polymorphic: true

  has_many :diagnostic_faults, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :reminders, dependent: :destroy
  has_many :documents, as: :documentable, dependent: :destroy
  has_many :fuel_entries, dependent: :destroy

  has_many :diagnostic_statistics, dependent: :destroy
  has_many :gps_statistics, dependent: :destroy

  validates_presence_of :make
  validates_presence_of :model
  validates_presence_of :registration

  validates_uniqueness_of :registration

  before_save :process_avatar

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

  private

  REGEX = /\Adata:[a-zA-Z\-]*\/[a-zA-Z\-]*;base64,(.*)\z/

  def process_avatar
    accepted_formats = %w(.jpg .jpeg .png .gif)
    if avatar_file.present? && avatar.present?
      if accepted_formats.include? File.extname(avatar_file)
        prepend_mime unless avatar.match(REGEX)
      else
        errors[:base] << 'File type is not allowed'
        false
      end
    end
  end

  def prepend_mime
    mime = MIME::Types.type_for(avatar_file).first.content_type
    avatar.prepend("data:#{mime};base64,")
  end
end
