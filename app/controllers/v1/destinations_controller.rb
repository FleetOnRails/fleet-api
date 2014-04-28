module V1
  class DestinationsController < BaseController
    doorkeeper_for :all

    def index
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @destinations = @group.destinations

        respond_with @destinations
      end
    end

    def show
      if params[:group_id]
        @group = Group.find(params[:id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @destination = @group.destinations.find(params[:id])

        respond_with @destinations
      end
    end

    def create
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @destination = Destination.create!(destination_params)
        @group.destinations << @destination
        @group.save!

        respond_with @destination
      end
    end

    def update
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @destination = @group.destinations.find(params[:id])
        @destination.update!(destination_params)
        @group.save!
        @destination.save!

        respond_with @destination
      end
    end

    def destroy
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @destination = @group.destinations.find(params[:id])
        @destination.destroy!
        @destination.save!
        @group.save!

        respond_with @destination
      end
    end

    private

    def destination_params
      params.required(:destination).permit(:name, :location_attributes => [:latitude, :longitude, :address])
    end
  end
end

