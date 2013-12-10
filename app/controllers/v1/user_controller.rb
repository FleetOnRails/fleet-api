class V1::UserController < ApplicationController
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

