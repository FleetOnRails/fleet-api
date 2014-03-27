module V1
  class ExpensesController < BaseController
    doorkeeper_for [:all]

    def index
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @expenses = @car.expenses

          respond_with @expenses
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @expenses = @car.expenses

          respond_with @expenses
        end
      end
    end

    def show
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @expense = @car.expenses.find(params[:id])

          respond_with @expense
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @expense = @car.expenses.find(params[:id])

          respond_with @expense
        end
      end
    end

    def create
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @expense = Expense.create!(expense_params)
          @car.expenses << @expense

          respond_with @expense
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @expense = Expense.create!(expense_params)
          @car.expenses << @expense

          respond_with @expense
        end
      end
    end

    def update
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @expense = @car.expenses.find(params[:id])
          @expense.update!(expense_params)

          respond_with @expense
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @expense = @car.expenses.find(params[:id])
          @expense.update!(expense_params)

          respond_with @expense
        end
      end
    end

    def delete
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @expense = @car.expenses.find(params[:id])
          @expense.destroy!

          respond_with @expense
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @expense = @car.expenses.find(params[:id])
          @expense.destroy!

          respond_with @expense
        end
      end
    end

    private

    def expense_params
      params.required(:service_record).permit(:odometer, :type, :date,
                                              :price, :description,
                                              :location_attributes => [:latitude, :longitude, :address])

    end
  end
end
