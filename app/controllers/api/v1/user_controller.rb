module Api
  module V1
    class UserController < BaseController

      def index
        @users = User.all
        respond_with [:json]
      end

      def show
        @user = User.find(params[:id])
        respond_with [:json]
      end

      # POST /api/v1/user.json
      # POST /api/v1/user.xml
      def create
        @user = User.new(:address => params[:address], :email => params[:email],
                         :first_name => params[:first_name], :last_name => params[:last_name],
                         :password => User.hashPassword(params[:password]), :phone_number => params[:phone_number],
                         :username => params[:username])
        if @user.save
          render status: :created
        else
          render status: :unprocessable_entity
        end
      end

      def destroy
        @user = User.find(params[:id])
        if @user.destroy
          render status: :ok
        else
          render status: :unprocessable_entity
        end
      end

    end
  end
end


