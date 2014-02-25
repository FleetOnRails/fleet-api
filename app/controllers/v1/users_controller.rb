module V1
  class UsersController < BaseController
    doorkeeper_for [:index, :show, :update, :destroy]

    def index
      if params[:group_id]
        @group = Group.find(params[:group_id])
        @users = @group.users
        raise NotPrivileged unless @group.is_member?(@current_user)
      else
        @users = User.all
      end

      respond_with @users
    end

    def show
      @user = User.find(params[:id])

      respond_with @user
    end

    def update
    end

    def create
      if params[:group_id]
        @group = Group.find(params[:group_id])
        @user = User.find(params[:user_id])
        raise DuplicateEntry if @group.is_member?(@user)
        raise NotPrivileged unless @group.is_member?(@current_user)
        @group.users <<(@user)
        @group.save!
        @user.save!
      else
        @user = User.new
        @user.first_name = params[:first_name]
        @user.last_name = params[:last_name]
        @user.username = params[:username]
        @user.email = params[:email]
        @user.password = params[:password]
        @user.save!
      end

      respond_with @user
    end

    def destroy
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @user = User.find(params[:id])
        @group.users.delete(@user)
        @group.save!
        @user.save!
      else
        raise NotPrivileged
      end

      respond_with @user
    end
  end
end


