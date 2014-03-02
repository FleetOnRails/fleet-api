class Avatar < ActiveRecord::Base
  mount_uploader :media, AvatarUploader
end
