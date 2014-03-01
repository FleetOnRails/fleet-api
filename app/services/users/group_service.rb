module Users
  class GroupService < BaseService
    def initialize(params, current_user, group_id)
      @params, @current_user, @group_id = params.dup, current_user, group_id
    end

    def add_user
      @group = Group.find(@group_id)
      @user = User.find(@params[:user_id])
      raise DuplicateEntry if @group.is_member?(@user)
      raise NotPrivileged unless @group.is_member?(@current_user)
      @group.users <<(@user)
      @group.save!
      @user.save!
      @user
    end
  end
end