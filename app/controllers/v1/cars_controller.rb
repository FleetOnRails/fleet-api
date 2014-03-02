module V1
  class CarsController < BaseController
    doorkeeper_for [:all]

    include AvatarHelper

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

    def create
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
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
      else
        @car = @current_user.cars.find(params[:id])
        @car.update!(car_params)
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
      params.required(:car).permit(:make, :model, :registration)
    end
  end
end
