module Avatars
  class CreateService < BaseService
    def execute
      avatar = Avatar.new
      avatar.media = get_default_avatar
      avatar
    end

    def get_default_avatar
      File.new("#{Rails.root}/public/img/user/unknown_user.gif")
    end
  end
end