module V1
  class ServiceRecordsController < BaseController
    doorkeeper_for [:all]

    def index
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @service_records = @car.service_records

          respond_with @service_records
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @service_records = @car.service_records

          respond_with @service_records
        end
      end
    end

    def show
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @service_record = @car.service_records.find(params[:id])

          respond_with @service_record
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @service_record = @car.service_records.find(params[:id])

          respond_with @service_record
        end
      end
    end

    def create
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @service_record = ServiceRecord.create!(service_record_params)
          @car.service_records <<(@service_record)

          respond_with @service_record
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @service_record = ServiceRecord.create!(service_record_params)
          @car.service_records <<(@service_record)

          respond_with @service_record
        end
      end
    end

    def update
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @service_record = @car.service_records.find(params[:id])
          @service_record.update!(service_record_params)

          respond_with @service_record
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @service_record = @car.service_records.find(params[:id])
          @service_record.update!(service_record_params)

          respond_with @service_record
        end
      end
    end

    def destroy
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @service_record = @car.service_records.find(params[:id])
          @service_record.destroy!

          respond_with @service_record
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @service_record = @car.service_records.find(params[:id])
          @service_record.destroy!

          respond_with @service_record
        end
      end
    end

    private

    def service_record_params
      params.required(:service_record).permit(:odometer_reading,
                                              :technician,
                                              :description,
                                              :location_attributes => [:latitude, :longitude, :address])
    end
  end
end
