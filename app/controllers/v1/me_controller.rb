module V1
  class MeController < BaseController
    doorkeeper_for [:index, :update] unless Rails.env.test?

    def index
      respond_with @current_user
    end

    def update
      @current_user.first_name = params[:first_name]
      @current_user.last_name = params[:last_name]
      @current_user.email = params[:email]
      @current_user.phone_no = params[:phone_no]
      @current_user.save!

      respond_with @current_user
    end

    private

    def me_params
      params.permit(:first_name, :last_name, :email, :phone_no)
    end
  end
end
