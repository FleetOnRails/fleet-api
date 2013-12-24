module Api
  module V1
    class BaseController < ApplicationController
      #before_filter :save_user_location, :if => lambda { request.env['user.location'] }

      resource_description do
        api_version 'v1'
        app_info 'FleetOnRails API version 1'
        api_base_url '/api/v1'
      end

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

      #def save_user_location
      #  @current_user.location.latitude = request.env['user.location'][:latitude]
      #  @current_user.location.longitude = request.env['user.location'][:longitude]
      #  @current_user.save! #TODO: We should think of a global place to save the current user. We dont want to invoke .save! too much!
      #end

      private
      def current_user
        if doorkeeper_token
          @current_user ||= User.find(doorkeeper_token.resource_owner_id)
        end
      end
    end
  end
end