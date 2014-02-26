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
        @current_user.first_name = params[:first_name]
        @current_user.last_name = params[:last_name]
        @current_user.email = params[:email]
        @current_user.phone_no = params[:phone_no]
        @current_user.password = params[:password] || @current_user.password
        @current_user.avatar = MeHelper.build_avatar(params[:avatar_data], params[:avatar_extension])
        @current_user.save!
      else
        @current_user.first_name = params[:first_name]
        @current_user.last_name = params[:last_name]
        @current_user.email = params[:email]
        @current_user.phone_no = params[:phone_no]
        @current_user.password = params[:password] || @current_user.password
        @current_user.save!
      end

      respond_with @current_user
    end
  end
end