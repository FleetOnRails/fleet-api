module V1
  class UsersController < BaseController
    doorkeeper_for [:index, :show, :update, :destroy] unless Rails.env.test?

    def index
      if params[:group_id]
        @users = Group.find(params[:group_id]).users
      else
        @users = User.all
      end
    end

    def show
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
    end

    def create
      if params[:group_id]
        @group = Group.find(params[:group_id])
        @user = User.find(params[:user_id])
        @group.users <<(@user)
        @group.save!
        @user.save!
      else
        @user = User.new
        @user.first_name = params[:first_name]
        @user.last_name = params[:last_name]
        @user.username = params[:username]
        @user.email = params[:email]
        @user.password = params[:password]
        @user.save!
      end
    end

    def destroy
      if params[:group_id]
        @group = Group.find(params[:group_id])
        @user = User.find(params[:id])
        @group.users.delete(@user)
        @group.save!
        @user.save!
      else
        @user = User.find(params[:id])
        @user.destroy
      end
    end
  end
end


