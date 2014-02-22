module V1
  class CarsController < BaseController
    doorkeeper_for [:index, :show, :update, :create, :destroy] unless Rails.env.test?

    def index
      if params[:group_id]
        @cars = Group.find(params[:group_id]).cars
      else
        @cars = @current_user.cars
      end
    end

    def show
      @car = Car.find(params[:id])
    end

    def create
      if params[:group_id]
        @car = Car.new
        @group = Group.find(params[:group_id])
        @drivers = @group.users
        @car.make = params[:make]
        @car.model = params[:model]
        @car.registration = params[:registration]
        @group.cars <<(@car)
        @car.users <<(@drivers)
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
      @car = Car.find(params[:id])
      raise NotPrivileged unless @car.is_driver?(@current_user)
    end

    def destroy
      @car = Car.find(params[:id])
      raise NotPrivileged unless @car.is_driver?(@current_user)
      @car.destroy
    end
  end
end
