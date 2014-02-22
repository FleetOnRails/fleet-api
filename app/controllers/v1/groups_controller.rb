module V1
  class GroupsController < BaseController
    doorkeeper_for [:index, :show, :update, :create, :destroy] unless Rails.env.test?

    def index
      @groups = @current_user.groups
    end

    def show
      @group = Group.find_by(params[:id])
      raise NotPrivileged unless @group.is_member?(@current_user)

      respond_with @group
    end

    def create
      @group = Group.new
      @group.name = params[:name]
      @group.save!
      @current_user.groups <<(@group)
    end

    def update
    end

    def destroy
      @group = Group.find_by(params[:id])
      NotPrivileged unless @group.is_member?(@current_user)
      @group.destroy
    end
  end
end
