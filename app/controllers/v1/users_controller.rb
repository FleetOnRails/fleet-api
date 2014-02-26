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
        @user = User.create!(user_params)

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
      else
        raise NotPrivileged
      end

      respond_with @user
    end

    private

    def user_params
      params.required(:user).permit(:first_name, :last_name, :username, :email, :password, :phone_no)
    end
  end
end


