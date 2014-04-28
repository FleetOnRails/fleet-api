module V1
  class GpsStatisticsController < BaseController
    doorkeeper_for :all

    def index
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @gps_statistics = @car.gps_statistics
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @gps_statistics = @car.gps_statistics
        end
      end

      respond_with @gps_statistics
    end

    def show
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @gps_statistic = @car.gps_statistics.find(params[:id])
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @gps_statistic = @car.gps_statistics.find(params[:id])
        end
      end

      respond_with @gps_statistic
    end

    def create
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @gps_statistic = GpsStatistic.create!(gps_statistic_params)
          @car.add_gps_statistic(@gps_statistic)
          @car.save!
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @gps_statistic = GpsStatistic.create!(gps_statistic_params)
          @car.add_gps_statistic(@gps_statistic)
          @car.save!
        end
      end

      respond_with @gps_statistic
    end

    def update
      # TODO - Should there be an update method ?
    end

    def destroy
      # TODO - Should there be an destroy method ?
    end

    private

    def gps_statistic_params
      params.required(:gps_statistic).permit(:kmh, :latitude, :longitude)
    end
  end
end
