module V1
  class GroupsController < BaseController
    doorkeeper_for [:index, :show, :update, :create, :destroy] unless Rails.env.test?

    def index
      @groups = @current_user.groups
    end

    def show
      @group = Group.find(params[:id])
      raise NotPrivileged unless @group.is_member?(@current_user)
    end

    def create
      @group = Group.new
      @group.name = params[:name]
      @current_user.groups <<(@group)
      @group.save!
      @current_user.save!
    end

    def update
      @group = Group.find(params[:id])
      if @group.is_member?(@current_user)
        @group.name = params[:name]
        @group.save!
      else
        raise NotPrivileged
      end
    end

    def destroy
      @group = Group.find(params[:id])
      raise NotPrivileged unless @group.is_member?(@current_user)
      @group.destroy
    end
  end
end
