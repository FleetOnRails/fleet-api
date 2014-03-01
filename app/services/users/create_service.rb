module Users
  class CreateService < BaseService
    def initialize(params)
      @user_id = params.dup
    end

    def execute
      user = User.create!(@user_id)
      user.avatar = get_default_avatar
      user.save!
      user
    end

    def get_default_avatar
      File.new("#{Rails.root}/public/img/user/unknown_user.gif")
    end
  end
end