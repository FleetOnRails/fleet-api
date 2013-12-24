module Api
  module V1
    class UserController < BaseController
      doorkeeper_for :all

      def index
        @users = current_user
      end

      def show
        @user = User.find_by(params[:id])
      end

      def update
        @user = User.find_by(params[:id])
        User.update
      end

      def create
        @user = User.new(user_params)
        @user.save
      end

      def destroy
        @user = User.find_by(params[:id])
        @user.destroy
      end

      private
      def user_params
        params.require(:user).permit(:first_name, :last_name, :email,
                                     :hashed_password, :phone_no, :group_id,
                                     :username, :permission_level)
      end
    end
  end
end

