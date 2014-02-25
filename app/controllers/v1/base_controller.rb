module V1
  class BaseController < ActionController::Base
    class NotPrivileged < StandardError; end

    respond_to :json

    before_action :find_current_user

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

    def find_current_user
      if Rails.env.test?
        @current_user ||= User.find_by_first_name(:alan)
      elsif doorkeeper_token
        @current_user ||= User.find(doorkeeper_token.resource_owner_id)
      end
    end
  end
end
