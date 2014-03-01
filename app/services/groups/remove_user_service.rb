module Groups
  class RemoveUserService < BaseService
    def initialize(user_id, group_id, current_user)
      @user_id, @group_id, @current_user = user_id.dup, group_id, current_user
    end

    def execute
      group = Group.find(@group_id)
      raise NotPrivileged unless group.is_member?(@current_user)
      user = User.find(@user_id)
      group.users.delete(user)
      group.save!
      user.save!
      user
    end
  end
end