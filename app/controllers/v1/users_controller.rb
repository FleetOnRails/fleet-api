module V1
  class UsersController < BaseController
    def index
      @users = User.all

      respond_with @users
    end

    def show
      @user = User.find_by(params[:id])
    end

    def update
      @user = User.find_by(params[:id])
      User.update
    end

    def create
      @user = User.new
      @user.first_name = params[:first_name]
      @user.last_name = params[:last_name]
      @user.email = params[:email]
      @user.password = params[:password]
      @user.password_confirmation = params[:password_confirmation]
      @user.username = params[:username]
      @user.save!

      respond with @user
    end

    def destroy
      @user = User.find_by(params[:id])
      @user.destroy
    end

    private

    def user_params
      params.require(:users).permit(:first_name, :last_name, :email,
                                    :hashed_password, :phone_no, :group_id,
                                    :username, :permission_level)
    end
  end
end


