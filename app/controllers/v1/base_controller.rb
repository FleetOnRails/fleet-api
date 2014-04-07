module V1
  class BaseController < ActionController::Base
    respond_to :json

    # include FleetOnRails::Rescue

    before_action :find_current_user

    def find_current_user
      if doorkeeper_token
        @current_user ||= User.find(doorkeeper_token.resource_owner_id)
      end
    end
  end
end
