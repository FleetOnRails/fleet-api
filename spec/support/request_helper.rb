module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body)
    end

    def bypass_authentication
      current_user = FactoryGirl.create(:user)
      V1::BaseController.any_instance.stub(:find_current_user)
      controller.instance_eval { @current_user = current_user }
      @current_user = current_user
    end

    def remove_authentication
      @current_user = nil
    end
  end
end