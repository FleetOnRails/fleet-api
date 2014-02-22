module V1
  class UsersController < BaseController
    doorkeeper_for [:index, :show, :update, :destroy] unless Rails.env.test?

    def index
      @users = User.all
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
      @user.username = params[:username]
      @user.email = params[:email]
      @user.password = params[:password]
      @user.password_confirmation = params[:password_confirmation]
      @user.save!
    end

    def destroy
      @user = User.find_by(params[:id])
      @user.destroy
    end
  end
end


