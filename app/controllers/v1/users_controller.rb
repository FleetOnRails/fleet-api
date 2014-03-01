module V1
  class UsersController < BaseController
    doorkeeper_for [:index, :show, :update, :destroy]

    include UsersHelper

    def index
      if params[:group_id]
        @group = Group.find(params[:group_id])
        @users = @group.users
        raise NotPrivileged unless @group.is_member?(@current_user)

        respond_with @users
      else
        @users = User.all

        respond_with @users
      end
    end

    def show
      @user = User.find(params[:id])

      respond_with @user
    end

    def update
    end

    def create
      if params[:group_id]
        @user = ::Users::GroupService.new(user_params, @current_user, params[:group_id]).add_user

        respond_with @user
      else
        @user = ::Users::CreateService.new(user_params).create

        respond_with @user
      end
    end

    def destroy
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @user = User.find(params[:id])
        @group.users.delete(@user)
        @group.save!
        @user.save!

        respond_with @user
      else
        raise NotPrivileged
      end
    end

    private

    def user_params
      params.required(:user).permit(:first_name, :last_name, :username, :email, :password, :phone_no, :user_id)
    end
  end
end


