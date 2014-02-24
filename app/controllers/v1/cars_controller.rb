module V1
  class CarsController < BaseController
    doorkeeper_for [:index, :show, :update, :create, :destroy] unless Rails.env.test?

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
        @car = Car.new
        @car.make = params[:make]
        @car.model = params[:model]
        @car.registration = params[:registration]
        @group.cars <<(@car)
        @car.save!
        @group.save!
      else
        @car = Car.new
        @car.make = params[:make]
        @car.model = params[:model]
        @car.registration = params[:registration]
        @current_user.cars <<(@car)
        @car.save!
        @current_user.save!
      end
    end

    def update
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @car = @group.cars.find(params[:id])
        @car.make = params[:make] || @car.make
        @car.model = params[:model] || @car.model
        @car.registration = params[:registration] || @car.registration
        @car.save!
        @group.save!
      else
        @car = @current_user.cars.find(params[:id])
        @car.make = params[:make] || @car.make
        @car.model = params[:model] || @car.model
        @car.registration = params[:registration] || @car.registration
        @car.save!
      end
    end

    def destroy
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @group.cars.find(:id)
        @car.destroy
        @car.save!
        @group.save!
      else
        @car = @current_user.cars.find(:id)
        @car.destroy
        @car.save!
      end
    end
  end
end
