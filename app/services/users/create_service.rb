module Users
  class CreateService < BaseService
    def initialize(params)
      @params = params.dup
    end

    def create
      @user = User.create!(@params)
      @user.avatar = get_default_avatar
      @user.save!
      @user
    end

    def get_default_avatar
      File.new("#{Rails.root}/public/img/user/unknown_user.gif")
    end
  end
end