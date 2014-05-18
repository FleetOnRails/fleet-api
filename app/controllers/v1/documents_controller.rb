module V1
  class DocumentsController < BaseController
    doorkeeper_for :all

    # TODO - This badly needs refactoring

    def index
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @documents = @car.documents

          respond_with @documents
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @documents = @car.documents

          respond_with @documents
        end
      elsif params[:expense_id]
        @expense = Expense.find(params[:expense_id])
        @car = Car.find(@expense.car_id)
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @documents = @expense.documents

          respond_with @documents
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @documents = @expense.documents

          respond_with @documents
        end
      end
    end

    def show
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @document = @car.documents.find(params[:id])

          respond_with @document
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @document = @car.documents.find(params[:id])

          respond_with @document
        end
      elsif params[:expense_id]
        @expense = Expense.find(params[:expense_id])
        @car = Car.find(@expense.car_id)
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @document = @expense.documents.find(params[:id])

          respond_with @document
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @document = @expense.documents.find(params[:id])

          respond_with @document
        end
      end
    end

    def create
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @document = Document.new
          if params[:file].present?
            @document.document = params[:file]
            @document.title = params[:document][:title]
            @document.save!
          end
          @car.documents << @document

          respond_with @document
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @document = Document.new
          if params[:file].present?
            @document.document = params[:file]
            @document.title = params[:document][:title]
            @document.save!
          end
          @car.documents << @document

          respond_with @document
        end
      elsif params[:expense_id]
        @expense = Expense.find(params[:expense_id])
        @car = Car.find(@expense.car_id)
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @document = Document.new
          if params[:file].present?
            @document.document = params[:file]
            @document.title = params[:document][:title]
            @document.save!
          end
          @expense.documents << @document

          respond_with @document
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @document = Document.new
          if params[:file].present?
            @document.document = params[:file]
            @document.title = params[:document][:title]
            @document.save!
          end
          @expense.documents << @document

          respond_with @document
        end
      end
    end

    def update
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @document = @car.documents.find(params[:id])
          if params[:file].present?
            @document.document = params[:file]
            @document.title = params[:document][:title]
            @document.save!
          end

          respond_with @document
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @document = @car.documents.find(params[:id])
          if params[:file].present?
            @document.document = params[:file]
            @document.title = params[:document][:title]
            @document.save!
          end

          respond_with @document
        end
      elsif params[:expense_id]
        @expense = Expense.find(params[:expense_id])
        @car = Car.find(@expense.car_id)
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @document = @expense.documents.find(params[:id])
          if params[:file].present?
            @document.document = params[:file]
            @document.title = params[:document][:title]
            @document.save!
          end

          respond_with @document
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @document = @expense.documents.find(params[:id])
          if params[:file].present?
            @document.document = params[:file]
            @document.title = params[:document][:title]
            @document.save!
          end

          respond_with @document
        end
      end
    end

    def destroy
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @document = @car.documents.find(params[:id])
          @document.destroy!

          respond_with @document
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @document = @car.documents.find(params[:id])
          @document.destroy!

          respond_with @document
        end
      elsif params[:expense_id]
        @expense = Expense.find(params[:expense_id])
        @car = Car.find(@expense.car_id)
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @document = @expense.documents.find(params[:id])
          @document.destroy!

          respond_with @document
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @document = @expense.documents.find(params[:id])
          @document.destroy!

          respond_with @document
        end
      end
    end

    private

    def document_params
      params.required(:document).permit(:title)
    end
  end
end
