module Api
  module V1
    class BaseController < ApplicationController
      resource_description do
        api_version 'v1'
      end
    end
  end
end