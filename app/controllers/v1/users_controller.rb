module V1
  class UsersController < BaseController
    doorkeeper_for [:index, :show, :update, :destroy]

    def index
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @users = @group.users
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
        @user = ::Groups::AddUserService.new(user_params, params[:group_id], @current_user).execute
        respond_with @user
      else
        @user = ::Users::CreateService.new(user_params).execute
        respond_with @user
      end
    end

    def destroy
      if params[:group_id]
        @user = ::Groups::RemoveUserService.new(params[:id], params[:group_id], @current_user).execute
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


