module Oauth
  class CustomApplicationsController < CustomOauthController
    http_basic_authenticate_with name: 'admin', password: 'fleetonrails'

    def index
      @applications = Doorkeeper::Application.all

      respond_with @applications
    end

    def show
      @application = Doorkeeper::Application.find(params[:id])

      respond_with @application
    end

    def create
      @application = Doorkeeper::Application.new(application_params)
      @application.save!

      respond_with @application
    end

    def update
      @application = Doorkeeper::Application.find(params[:id])
      @application.update!(application_params)

      respond_with @application
    end

    def destroy
      @application = Doorkeeper::Application.find(params[:id])

      @application.destroy!
    end

    private

    def application_params
      if params.respond_to?(:permit)
        params.require(:application).permit(:name, :redirect_uri)
      else
        params[:application].slice(:name, :redirect_uri) rescue nil
      end
    end
  end
end
