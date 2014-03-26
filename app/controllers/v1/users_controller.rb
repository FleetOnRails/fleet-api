module V1
  class UsersController < BaseController
    doorkeeper_for [:index, :show, :update, :destroy]

    # TODO - Shouldn't doorkeeper do this for me ?
    before_filter :ensure_current_user, only: [:index, :show, :update]

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

    # FIXME - this route is unprotected by doorkeeper
    def create
      if params[:group_id]
        @group = Group.find(params[:group_id])
        @user = User.find(params[:user][:user_id])
        raise NotPrivileged unless @group.is_owner?(@current_user) || @group.is_manager?(@current_user)
        @group.add_user(@user, params[:user][:group_access])
        @group.save!
      else
        raise Exception if params[:user][:password] != params[:user][:password_confirmation]
        @user = User.new(user_params)
        @user.admin = false
        @user.save!
        @user.send_registration_mail
      end

      respond_with @user
    end

    def destroy
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_owner?(@current_user) || @group.is_manager?(@current_user)
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
      params.required(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :phone_no)
    end

    def ensure_current_user
      raise NotPrivileged unless @current_user
    end
  end
end


