module V1
  class BaseController < ActionController::Base

    after_filter :set_cross_domain_header

    rescue_from ActiveRecord::RecordInvalid do |exception|
      @object = exception.record
      render status: 400, template: 'v1/errors/record_invalid'
    end

    rescue_from ActiveRecord::RecordNotFound do
      @object = Object.new
      render status: 404, template: 'v1/errors/record_not_found'
    end

    private

    def current_user
      if doorkeeper_token
        @current_user ||= User.find(doorkeeper_token.resource_owner_id)
      end
    end

    def doorkeeper_unauthorized_render_options
      { json: '{"message":"401 Unauthorized"}' }
    end

    def set_cross_domain_header
      #response.headers['Access-Control-Allow-Origin'] # = '*' if Rails.development?
      response.headers['Access-Control-Allow-Origin'] = '*'
      #response.headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      #response.headers['Access-Control-Request-Method'] = '*'
      #response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end
  end
end
