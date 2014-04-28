module V1
  class RemindersController < BaseController
    doorkeeper_for :all

    def index
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @reminders = @car.reminders

          respond_with @expenses
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @reminders = @car.reminders

          respond_with @expenses
        end
      end
    end

    def show
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @reminder = @car.reminders.find(params[:id])

          respond_with @reminder
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @reminder = @car.reminders.find(params[:id])

          respond_with @reminder
        end
      end
    end

    def create
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @reminder = Reminder.create!(reminder_params)
          @car.reminders << @reminder

          respond_with @reminder
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @reminder = Reminder.create!(reminder_params)
          @car.reminders << @reminder

          respond_with @reminder
        end
      end
    end

    def update
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @reminder = @car.reminders.find(params[:id])
          @reminder.update!(reminder_params)

          respond_with @reminder
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @reminder = @car.reminders.find(params[:id])
          @reminder.update!(reminder_params)

          respond_with @reminder
        end
      end
    end

    def destroy
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @reminder = @car.reminders.find(params[:id])
          @reminder.destroy!

          respond_with @reminder
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @reminder = @car.reminders.find(params[:id])
          @reminder.destroy!

          respond_with @reminder
        end
      end
    end

    private

    def reminder_params
      params.required(:reminder).permit(:date, :odometer, :reminder_type, :description)
    end
  end
end
