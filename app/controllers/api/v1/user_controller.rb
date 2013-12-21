module Api
  module V1
    class UserController < BaseController
      doorkeeper_for :all

      api :GET, '/users'
      description 'Returns all the users in the database that the currently logged in user can see, based on Auth token.'
      #param :auth_token, String, :desc => 'Users Auth token', :required => true
      example File.read("#{Rails.root}/public/api_docs/v1/user/index.json")
      def index
        #@users = User.all
        @users = current_user
      end

      api :GET, '/users/:id'
      description 'Returns the users with an id of :id in the database'
      #param :auth_token, String, :desc => 'Users Auth token', :required => true
      example File.read("#{Rails.root}/public/api_docs/v1/user/show.json")
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

