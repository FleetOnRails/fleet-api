module Users
  class ShowService < BaseService
    def initialize(user_id)
      @user_id = user_id
    end

    def execute
      User.find(@user_id)
    end
  end
end