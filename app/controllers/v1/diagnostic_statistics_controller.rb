module V1
  class DiagnosticStatisticsController < BaseController
    doorkeeper_for :all

    def index
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @diagnostic_statistics = @car.diagnostic_statistics
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @diagnostic_statistics = @car.diagnostic_statistics
        end
      end

      respond_with @diagnostic_statistics
    end

    def show
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @diagnostic_statistic = @car.diagnostic_statistics.find(params[:id])
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @diagnostic_statistic = @car.diagnostic_statistics.find(params[:id])
        end
      end

      respond_with @diagnostic_statistic
    end

    def create
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @diagnostic_statistic = DiagnosticStatistic.create!(diagnostic_statistic_params)
          @car.add_diagnostic_statistic(@diagnostic_statistic)
          @car.save!
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @diagnostic_statistic = DiagnosticStatistic.create!(diagnostic_statistic_params)
          @car.add_diagnostic_statistic(@diagnostic_statistic)
          @car.save!
        end
      end

      respond_with @diagnostic_statistic
    end

    def update
      # TODO - Should there be a update method for a diagnostic statistic ?
    end

    def destroy
      # TODO - Should there be a destroy method for a diagnostic statistic ?
    end

    private

    def diagnostic_statistic_params
      params.required(:diagnostic_statistic).permit(:kmh, :rpm, 'l/100km')
    end
  end
end
