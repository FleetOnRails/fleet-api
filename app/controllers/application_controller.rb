class ApplicationController < ActionController::Base
  resource_description do
    api_versions 'v1'
  end

  def not_found!
    render 'errors/404', layout: 'errors', status: 404
  end
end
