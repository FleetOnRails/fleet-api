module V1
  class UsersController < BaseController
    doorkeeper_for [:index, :show, :update, :destroy] unless Rails.env.test?

    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
    end

    def create
      @user = User.new
      @user.first_name = params[:first_name]
      @user.last_name = params[:last_name]
      @user.username = params[:username]
      @user.email = params[:email]
      @user.password = params[:password]
      @user.save!
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
    end
  end
end


