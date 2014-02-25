module V1
  class MeController < BaseController
    doorkeeper_for [:all]

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
        @current_user.avatar = build_avatar
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

    private

    def build_avatar
      tempfile = Tempfile.new ['upload', params[:avatar_extension]]
      tempfile.binmode
      tempfile.write(Base64.decode64(params[:avatar_data]))
      tempfile
    end
  end
end