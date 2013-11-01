module Api
  module V1
    class UserController < BaseController

      def index
        @users = User.all
        respond_with [:json, :xml]
      end

      def show
        @user = User.find(params[:id])
        respond_with [:json, :xml]
      end

      # POST /api/v1/user.json
      # POST /api/v1/user.xml
      def create
        @user = User.new(:address => params[:address], :email => params[:email],
                         :first_name => params[:first_name], :last_name => params[:last_name],
                         :password => params[:password], :phone_number => params[:phone_number],
                         :username => params[:username])
        if @user.save
          respond_with [:json, :xml]
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @user = User.find(params[:id])
        if @user.destroy
          head :no_content
        else
          render status: :unprocessable_entity
        end
      end

    end
  end
end


