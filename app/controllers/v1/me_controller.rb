module V1
  class MeController < BaseController
    def index
      @me = current_user
    end

    def update
      @me = current_user
      @me.update_attributes(me_params)
    end

    private

    def me_params
      params.permit(:first_name, :last_name, :email, :phone_no)
    end
  end
end
