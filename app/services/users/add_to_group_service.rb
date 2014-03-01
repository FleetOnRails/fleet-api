module Users
  class AddToGroupService < BaseService
    def initialize(params, group_id, current_user)
      @user_id, @group_id, @current_user = params.dup, group_id, current_user
    end

    def execute
      group = Group.find(@group_id)
      user = User.find(@user_id[:user_id])
      raise DuplicateEntry if group.is_member?(user)
      raise NotPrivileged unless group.is_member?(@current_user)
      group.users <<(user)
      group.save!
      user.save!
      user
    end
  end
end