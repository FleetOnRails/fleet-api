class ApplicationController < ActionController::Base
  def not_found!
    render 'errors/404', layout: 'errors', status: 404
  end
end
