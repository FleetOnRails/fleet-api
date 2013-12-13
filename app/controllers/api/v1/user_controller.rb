module Api
  module V1
    class UserController < ApplicationController

      api :GET, '/users'
      def index
        @users = User.all
      end

      api :GET, '/users/:id'
      formats ['json']
      description 'method description'
      error :code => 401, :desc => 'Unauthorized'
      error :code => 404, :desc => 'Not Found'
      param :session, String, :desc => 'user is logged in', :required => true
      param :boolean_param, [true, false], :desc => 'array validator with boolean'
      example " 'user': {...} "
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

