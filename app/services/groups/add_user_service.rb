module Groups
  class AddUserService < BaseService
    def initialize(params, group_id, current_user)
      @user_id, @group_id, @current_user = params.dup, group_id, current_user
    end

    def execute
      group = Group.find(@group_id)
      user = User.find(@user_id[:user_id])
      raise ::V1::BaseController::NotPrivileged unless group.is_member?(@current_user)
      raise ::V1::BaseController::DuplicateEntry if group.is_member?(user)
      group.add_user(user, 20)
      group.save!
      user.save!
      user
    end
  end
end