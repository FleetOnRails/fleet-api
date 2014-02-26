module V1
  class MeController < BaseController
    doorkeeper_for [:all]

    include MeHelper

    def index
      @current_user

      respond_with @current_user
    end

    def update
      if params[:avatar_data] && params[:avatar_extension]
        @current_user.update!(me_params)
        @current_user.avatar = MeHelper.build_avatar(params[:avatar_data], params[:avatar_extension])
        @current_user.save!

        respond_with @current_user
      else
        @current_user.update!(me_params)
        @current_user.save!

        respond_with @current_user
      end
    end

    def me_params
      params.required(:me).permit(:first_name, :last_name, :username, :email, :phone_no)
    end
  end
end