module V1
  class DiagnosticFaultsController < BaseController
    doorkeeper_for [:all]

    def index
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @diagnostic_faults = @car.diagnostic_faults

          respond_with @diagnostic_faults
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @diagnostic_faults = @car.diagnostic_faults

          respond_with @diagnostic_faults
        end
      end
    end

    def show
      if params[:car_id]
        @car = @current_user.cars.find(params[:car_id])
        @diagnostic_fault = @car.diagnostic_faults.find(params[:id])

        respond_with @diagnostic_fault
      elsif params[:group_id] && params[:car_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @car = @group.cars.find(params[:id])
        @diagnostic_fault = @car.diagnostic_faults.find(params[:id])

        respond_with @diagnostic_fault
      end
    end

    def create
      if params[:car_id]
        @car = @current_user.cars.find(params[:car_id])
        @diagnostic_fault = DiagnosticFault.create!(diagnostic_fault_params)
        @car.diagnostic_faults <<(@diagnostic_fault)
        @car.save!

        respond_with @diagnostic_fault
      elsif params[:group_id] && params[:car_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @car = @group.cars.find(params[:id])
        @diagnostic_fault = DiagnosticFault.create!(diagnostic_fault_params)
        @car.diagnostic_faults <<(@diagnostic_fault)
        @car.save!

        respond_with @diagnostic_fault
      end
    end

    def update
      if params[:car_id]
        @car = @current_user.cars.find(params[:car_id])
        raise NotPrivileged unless @car
        @diagnostic_fault = @car.diagnostic_faults.find(params[:id])
        @diagnostic_fault.update!(diagnostic_fault_params)

        respond_with @diagnostic_fault
      end
    end

    def destroy
      # TODO - Should there be a destroy method for a fault code ?
    end

    private

    def diagnostic_fault_params
      params.required(:diagnostic_fault).permit(:fault_code, :status)
    end
  end
end
