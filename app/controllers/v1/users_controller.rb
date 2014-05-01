module V1
  class UsersController < BaseController
    doorkeeper_for :all, except: :create

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

    def download
      path = "#{Rails.root}#{request.path}"

      send_file path, :x_sendfile => true
    end

    def update
      if params[:group_id]
        @group = Group.find(params[:group_id])
        @user = User.find(params[:id])
        raise NotPrivileged unless @group.is_owner?(@current_user) || @group.is_manager?(@current_user)
        @group.add_user(@user, params[:user][:group_access])
        @group.save!
      end
    end

    def create
      raise Exception if params[:user][:password] != params[:user][:password_confirmation]
      @user = User.new(user_params)
      @user.admin = false
      @user.save!
      @user.send_registration_mail

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
  end
end


