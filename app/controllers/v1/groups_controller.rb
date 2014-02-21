module V1
  class GroupsController < BaseController
    doorkeeper_for [:index, :show, :update, :create, :destroy] unless Rails.env.test?

    def index
      @groups = @current_user.groups
      respond_with @groups
    end

    def show
      @group = User.find_by(params[:id])
      access_denied unless @group.is_member?(@current_user)
      respond_with @group
    end

    def create
      @group = Group.new
      @group.group_name = params[:group_name]
      @current_user.groups <<(@group)
      @group.save!
      @current_user.save!
      respond_with @group
    end

    def update
    end

    def destroy
      @group = Group.find_by(params[:id])
      access_denied unless @group.is_member?(@current_user)
      @group.destroy
      respond_with @group
    end
  end
end
