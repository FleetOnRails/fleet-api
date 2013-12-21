module Api
  module V1
    class BaseController < ApplicationController
      resource_description do
        api_version 'v1'
      end

      private

      def current_user
        if doorkeeper_token
          @current_user ||= User.find(doorkeeper_token.resource_owner_id)
        end
      end
    end
  end
end