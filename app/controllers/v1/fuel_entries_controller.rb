module V1
  class FuelEntriesController < BaseController
    doorkeeper_for [:all]

    def index
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @fuel_entries = @car.fuel_entries

          respond_with @fuel_entries
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @fuel_entries = @car.fuel_entries

          respond_with @fuel_entries
        end
      end
    end

    def show
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @fuel_entry = @car.fuel_entries.find(params[:id])

          respond_with @fuel_entry
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @fuel_entry = @car.fuel_entries.find(params[:id])

          respond_with @fuel_entry
        end
      end
    end

    def create
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @fuel_entry = FuelEntry.create!(fuel_entry_params)
          @fuel_entry.save!
          @car.fuel_entries <<(@fuel_entry)

          respond_with @fuel_entry
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @fuel_entry = FuelEntry.create!(fuel_entry_params)
          @fuel_entry.save!
          @car.fuel_entries <<(@fuel_entry)

          respond_with @fuel_entry
        end
      end
    end

    def update
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @fuel_entry = FuelEntry.find(params[:id])
          @fuel_entry.update(fuel_entry_params)

          respond_with @fuel_entry
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @fuel_entry = FuelEntry.find(params[:id])
          @fuel_entry.update(fuel_entry_params)

          respond_with @fuel_entry
        end
      end
    end

    def destroy
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @fuel_entry.destroy!

          respond_with @fuel_entry
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_manager?(@current_user)
          @fuel_entry.destroy!

          respond_with @fuel_entry
        end
      end
    end

    private

    def fuel_entry_params
      params.required(:fuel_entry).permit(
          :odometer,
          :liters,
          :price,
          :fuel_type,
          :filling_station,
          :filled_tank,
          :comment,
          :location_attributes => [:latitude, :longitude, :address])
    end
  end
end
