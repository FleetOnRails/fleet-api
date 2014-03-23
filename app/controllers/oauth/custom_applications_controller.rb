module Oauth
  class CustomApplicationsController < Doorkeeper::ApplicationsController
    http_basic_authenticate_with name: 'admin', password: 'fleetonrails'

    respond_to :json

    before_filter :check_format
    before_filter :set_application, :only => [:show, :edit, :update, :destroy]

    def index
      @applications = Doorkeeper::Application.all
    end

    def show
      respond_with @application
    end

    def create
      @application = Doorkeeper::Application.new(application_params)
      if @application.save!
        respond_with @application
      end
    end

    def update
      if @application.update_attributes(application_params)
        respond_with @application
      end
    end

    def destroy
      @application.destroy!
    end

    private

    def check_format
      render :nothing => true, :status => 406 unless params[:format] == 'json'
    end

    def set_application
      @application = Doorkeeper::Application.find(params[:id])
    end

    def application_params
      if params.respond_to?(:permit)
        params.require(:application).permit(:name, :redirect_uri)
      else
        params[:application].slice(:name, :redirect_uri) rescue nil
      end
    end
  end
end
