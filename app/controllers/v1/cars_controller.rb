module V1
  class CarsController < BaseController
    doorkeeper_for :all

    def index
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @cars = @group.cars
      else
        @cars = @current_user.cars
      end
    end

    def show
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @car = @group.cars.find(params[:id])
      else
        @car = @current_user.cars.find(params[:id])
      end
    end

    def download
      path = "#{Rails.root}#{request.path}"

      send_file path, :x_sendfile => true
    end

    def create
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_owner?(@current_user)
        @car = Car.create!(car_params)
        @group.cars <<(@car)
        @group.save!
      else
        @car = Car.create!(car_params)
        @current_user.cars <<(@car)
        @current_user.save!
      end
    end

    def update
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @car = @group.cars.find(params[:id])
        @car.update!(car_params)
        if params[:file].present?
          @car.avatar = params[:file]
          @car.save!
        end
      else
        @car = @current_user.cars.find(params[:id])
        @car.update!(car_params)
        if params[:file].present?
          @car.avatar = params[:file]
          @car.save!
        end
      end
    end

    def destroy
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @car = @group.cars.find(params[:id])
        @car.destroy
        @car.save!
        @group.save!
      else
        @car = @current_user.cars.find(params[:id])
        @car.destroy
        @car.save!
      end
    end

    private

    def car_params
      params.required(:car).permit(:make, :model, :registration, :avatar_file, :avatar)
    end
  end
end
