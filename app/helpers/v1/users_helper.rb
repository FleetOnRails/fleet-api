module V1
  module UsersHelper
    def get_default_avatar
      File.new("#{Rails.root}/public/img/user/unknown_user.gif")
    end
  end
end