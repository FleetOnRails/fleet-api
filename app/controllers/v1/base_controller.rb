module V1
  class BaseController < ActionController::Base
    respond_to :json

    before_action :find_current_user

    def find_current_user
      if doorkeeper_token
        @current_user ||= User.find(doorkeeper_token.resource_owner_id)
      end
    end

    ###
    # Custom Errors
    ###
    class NotPrivileged < StandardError; end
    class DuplicateEntry < StandardError; end

    rescue_from Exception do
      @object = Object.new
      render  :status => 500, template: 'v1/errors/server_error'
    end

    rescue_from ActiveRecord::RecordInvalid do |exception|
      @object = exception.record
      render status: 400, template: 'v1/errors/record_invalid'
    end

    rescue_from ActiveRecord::RecordNotFound do
      @object = Object.new
      render status: 404, template: 'v1/errors/record_not_found'
    end

    rescue_from NotPrivileged do
      render status: 403, template: 'v1/errors/not_privileged'
    end

    rescue_from DuplicateEntry do
      render status: 403, template: 'v1/errors/duplicate_entry'
    end
  end
end
