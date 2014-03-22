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
      else
        @current_user.update!(me_params)
        @current_user.save!

        respond_with @current_user
      end
    end

    def me_params
      params.required(:me).permit(:first_name, :last_name, :username, :email, :phone_no, :password, :password_confirmation)
    end
  end
end