module Api
  module V1
    class MeController < BaseController
      doorkeeper_for :all

      def index
         @me = current_user
      end

      def update
      end
    end
  end
end