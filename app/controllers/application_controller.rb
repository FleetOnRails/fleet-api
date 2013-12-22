class ApplicationController < ActionController::Base
  resource_description do
    api_versions 'v1'
  end

  private

  def current_user
    if doorkeeper_token
      @current_user ||= User.find(doorkeeper_token.resource_owner_id)
    end
  end
end
