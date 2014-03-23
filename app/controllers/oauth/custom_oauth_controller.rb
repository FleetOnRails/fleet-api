module Oauth
  class CustomOauthController < Doorkeeper::ApplicationController
    respond_to :json

    before_filter :check_format

    rescue_from ActiveRecord::RecordInvalid do |exception|
      @object = exception.record
      render status: 400, template: 'v1/errors/record_invalid'
    end

    rescue_from ActiveRecord::RecordNotFound do
      @object = Object.new
      render status: 404, template: 'v1/errors/record_not_found'
    end

    def check_format
      render :nothing => true, :status => 406 unless params[:format] == 'json'
    end
  end
end
