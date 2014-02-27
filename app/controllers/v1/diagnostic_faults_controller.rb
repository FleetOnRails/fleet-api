module V1
  class DiagnosticFaultsController < BaseController
    def index
      if params[:car_id]
        @car = @current_user.cars.find(params[:car_id])
        raise NotPrivileged unless @car
        @diagnostic_faults = @car.diagnostic_faults

        respond_with @diagnostic_faults
      end
    end

    def show
      if params[:car_id]
        @car = @current_user.cars.find(params[:car_id])
        raise NotPrivileged unless @car
        @diagnostic_fault = @car.diagnostic_faults.find(params[:id])

        respond_with @diagnostic_fault
      end
    end

    def create
      if params[:car_id]
        @car = @current_user.cars.find(params[:car_id])
        raise NotPrivileged unless @car
        @diagnostic_fault = DiagnosticFault.create!(diagnostic_fault_params)

        respond_with @diagnostic_fault
      end
    end

    def update
    end

    def destroy
    end

    private

    def diagnostic_fault_params
      params.required(:diagnostic_fault).permit(:mph, :rpm, :mpg)
    end
  end
end
