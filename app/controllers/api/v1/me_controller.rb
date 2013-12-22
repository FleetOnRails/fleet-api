module Api
  module V1
    class MeController < BaseController
      doorkeeper_for :all

      resource_description do
        short_description 'Everything about the currently logged-in user'
        path '/me'
        description 'All about the currently logged-in user. Use this resource to interact with the currently logged-in users profile.
        How to get your access token with email and password.
            curl -i http://localhost:3000/oauth/token
              -d grant_type=password
              -d client_id=<CLIENT_ID>
              -d client_secret=<CLIENT_SECRET>
              -d email=<YOUR_EMAIL>
              -d password=<YOUR_PASSWORD>

        How to get your access token with refresh token.
            curl -i http://localhost:3000/oauth/token
              -d grant_type=refresh_token
              -d client_id=<CLIENT_ID>
              -d client_secret=<CLIENT_SECRET>
              -d refresh_token=<REFRESH_TOKEN>'
      end

      api :GET, '/me'
      description 'Returns current user, based on Auth token.'
      param :access_token, String, :desc => 'Users OAuth token', :required => true
      example File.read("#{Rails.root}/public/api_docs/v1/user/index.json")
      def index
         @me = current_user
      end

      def update
      end
    end
  end
end