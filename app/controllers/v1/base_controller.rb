module V1
  class BaseController < ActionController::Base
    include FleetOnRails::Rescue

    doorkeeper_for :all
    respond_to :json

    before_action :find_current_user

    def find_current_user
      @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
  end
end
