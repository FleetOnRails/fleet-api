module Api
  module V1
    class BaseController < ApplicationController
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
    end
  end
end