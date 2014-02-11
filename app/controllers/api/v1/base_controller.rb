module Api
  module V1
    class BaseController < ActionController::Base

      rescue_from ActiveRecord::RecordInvalid do |exception|
        @object = exception.record
        render status: 400, template: 'api/v1/errors/record_invalid'
      end

      rescue_from ActiveRecord::RecordNotFound do
        @object = Object.new
        render status: 404, template: 'api/v1/errors/record_not_found'
      end

      #rescue_from ActiveRecord::NotPrivilegedError do
      #  @object = Object.new
      #  render status: 403, template: 'api/v1/errors/not_privileged_error'
      #end

      private
      def current_user
        if doorkeeper_token
          @current_user ||= User.find(doorkeeper_token.resource_owner_id)
        end
      end

      def doorkeeper_unauthorized_render_options
        {json: '{"message":"401 Unauthorized"}'}
      end
    end
  end
end