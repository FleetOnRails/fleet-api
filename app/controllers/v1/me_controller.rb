module V1
  class MeController < BaseController
    doorkeeper_for [:index, :update] unless Rails.env.test?

    def index
      @current_user
    end

    def update
      @current_user.first_name = params[:first_name]
      @current_user.last_name = params[:last_name]
      @current_user.email = params[:email]
      @current_user.phone_no = params[:phone_no]
      @current_user.password = params[:password] || @current_user.password
      @current_user.save!
    end
  end
end
