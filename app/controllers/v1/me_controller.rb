module V1
  class MeController < BaseController
    doorkeeper_for [:all]

    include AvatarHelper

    def index
      respond_with @current_user
    end

    def update
      if params[:me][:avatar_data] && params[:me][:avatar_extension]
        @current_user.update_without_password(me_params)
        @current_user.avatar = build_avatar(params[:me][:avatar_data], params[:me][:avatar_extension])
        @current_user.save!
      elsif params[:me][:password]
        raise NotPrivileged unless @current_user.valid_password?(params[:me][:current_password])
        raise NotPrivileged if params[:me][:password] != params[:me][:password_confirmation]
        @current_user.update_with_password(password_change_params)
        @current_user.save!
      else
        @current_user.update_without_password(me_params)
        @current_user.save!
      end

      respond_with @current_user
    end

    private

    def me_params
      params.required(:me).permit(:first_name, :last_name, :username, :email, :phone_no)
    end

    def password_change_params
      params.required(:me).permit(:current_password, :password, :password_confirmation)
    end
  end
end