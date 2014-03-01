module V1
  class UsersController < BaseController
    doorkeeper_for [:index, :show, :update, :destroy]

    def index
      if params[:group_id]
        @users = ::Users::IndexGroupService.new(params[:group_id], @current_user).execute
        respond_with @users
      else
        @users = ::Users::IndexService.new.execute
        respond_with @users
      end
    end

    def show
      @user = ::Users::ShowService.new(params[:id]).execute
      respond_with @user
    end

    def update
    end

    def create
      if params[:group_id]
        @user = ::Users::AddToGroupService.new(user_params, params[:group_id], @current_user).execute
        respond_with @user
      else
        @user = ::Users::CreateService.new(user_params).execute
        respond_with @user
      end
    end

    def destroy
      if params[:group_id]
        @user = ::Users::RemoveFromGroupService.new(params[:id], params[:group_id], @current_user).execute
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


