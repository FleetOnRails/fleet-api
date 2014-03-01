module Users
  class IndexGroupService < BaseService
    def initialize(group_id, current_user)
      @group_id, @current_user = group_id, current_user
    end

    def execute
      group = Group.find(@group_id)
      raise NotPrivileged unless group.is_member?(@current_user)
      group.users
    end
  end
end