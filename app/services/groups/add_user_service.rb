module Groups
  class AddUserService < BaseService
    def initialize(params, group_id, current_user)
      @params, @group_id, @current_user = params.dup, group_id, current_user
    end

    def execute
      group = Group.find(@group_id)
      user = User.find(@params[:user_id])
      raise ::V1::BaseController::NotPrivileged unless group.is_owner?(@current_user) || group.is_owner?(@current_user)
      group.add_user(user, @params[:permission_level])
      group.save!
      user.save!
      user
    end
  end
end