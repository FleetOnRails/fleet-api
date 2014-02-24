module V1
  class UsersController < BaseController
    doorkeeper_for [:index, :show, :update, :destroy] unless Rails.env.test?

    def index
      if params[:group_id]
        @group = Group.find(params[:group_id])
        @users = @group.users
        raise NotPrivileged unless @group.is_member?(@current_user)
      else
        @users = User.all
      end
    end

    def show
      @user = User.find(params[:id])
    end

    def update
      if @current_user.admin
        @user = User.find(params[:id])
        @user.admin = params[:set_admin]
        @user.save!
      else
        raise NotPrivileged
      end
    end

    def create
      if params[:group_id]
        @group = Group.find(params[:group_id])
        @user = User.find(params[:user_id])
        raise NotPrivileged if @group.is_member?(@user)
        if @group.is_member?(@current_user)
          @group.users <<(@user)
          @group.save!
          @user.save!
        else
          raise NotPrivileged
        end
      else
        @user = User.new
        @user.first_name = params[:first_name]
        @user.last_name = params[:last_name]
        @user.username = params[:username]
        @user.email = params[:email]
        @user.password = params[:password]
        @user.save!
      end
    end

    def destroy
      if params[:group_id]
        @group = Group.find(params[:group_id])
        @user = User.find(params[:id])
        @group.users.delete(@user)
        @group.save!
        @user.save!
      elsif @current_user.admin
        @user = User.find(params[:id])
        @user.destroy
      else
        raise NotPrivileged
      end
    end
  end
end


