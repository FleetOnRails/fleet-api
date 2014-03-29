class Group < ActiveRecord::Base
  has_many :cars, as: :owner, dependent: :destroy
  has_many :destinations, as: :destinationable, dependent: :destroy
  has_many :vendors, as: :venderable, dependent: :destroy
  has_one :location, as: :locationable, dependent: :destroy

  has_many :user_groups
  has_many :users, through: :user_groups

  accepts_nested_attributes_for :location

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_associated :location

  before_save :process_avatar

  def add_user(user, group_access)
    self.user_groups.create!(user_id: user.id, group_access: group_access)
  end

  def add_owner(user)
    self.add_user(user, OWNER)
  end

  def is_member?(user)
    self.users.each do |group_member|
      return true if group_member.id == user.id
    end
    false
  end

  def is_owner?(user)
    self.user_groups.owners.each do |user_groups|
      return true if user_groups.user_id == user.id
    end
    false
  end

  def is_manager?(user)
    self.user_groups.managers.each do |user_groups|
      return true if user_groups.user_id == user.id
    end
    false
  end

  def is_driver?(user)
    self.user_groups.drivers.each do |user_groups|
      return true if user_groups.user_id == user.id
    end
    false
  end

  def is_reporter?(user)
    self.user_groups.reporters.each do |user_groups|
      return true if user_groups.user_id == user.id
    end
    false
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
