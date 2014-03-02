module GroupConcern
  extend ActiveSupport::Concern

  included do
    mount_uploader :avatar, AvatarUploader
  end

  module ClassMethods

  end
end