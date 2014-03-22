module V1
  class MeController < BaseController
    doorkeeper_for [:all]

    include AvatarHelper

    def index
      @current_user

      respond_with @current_user
    end

    def update
      if params[:me][:avatar_data] && params[:me][:avatar_extension]
        @current_user.update!(me_params)
        @current_user.avatar = build_avatar(params[:me][:avatar_data], params[:me][:avatar_extension])
        @current_user.save!

        respond_with @current_user
      elsif params[:me][:current_password]
        rails NotPrivileged unless @current_user.valid_password?(params[:me][:current_password])
        @current_user.update!(password_change_params)
      else
        @current_user.update!(me_params)
        @current_user.save!

        respond_with @current_user
      end
    end

    def me_params
      params.required(:me).permit(:first_name, :last_name, :username, :email, :phone_no)
    end

    def password_change_params
      params.required(:me).permit(:password, :password_confirmation)
    end
  end
end