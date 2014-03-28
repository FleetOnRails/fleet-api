module V1
  class DocumentsController < BaseController
    doorkeeper_for [:all]

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
      elsif params[:service_record_id]
        @service_record = ServiceRecord.find(params[:service_record_id])
        @car = Car.find(@service_record.car_id)
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @documents = @service_record.documents

          respond_with @documents
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @documents = @service_record.documents

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
      elsif params[:service_record_id]
        @service_record = ServiceRecord.find(params[:service_record_id])
        @car = Car.find(@service_record.car_id)
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @document = @service_record.documents.find(params[:id])

          respond_with @document
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @document = @service_record.documents.find(params[:id])

          respond_with @document
        end
      end
    end

    def create
      if params[:car_id]
        @car = Car.find(params[:car_id])
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @document = Document.create!(document_params)
          @car.documents << @document

          respond_with @document
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @document = Document.create!(document_params)
          @car.documents << @document

          respond_with @document
        end
      elsif params[:service_record_id]
        @service_record = ServiceRecord.find(params[:service_record_id])
        @car = Car.find(@service_record.car_id)
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @document = Document.create!(document_params)
          @service_record.documents << @document

          respond_with @document
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @document = Document.create!(document_params)
          @service_record.documents << @document

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
          @document.update!(document_params)

          respond_with @document
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @document = @car.documents.find(params[:id])
          @document.update!(document_params)

          respond_with @document
        end
      elsif params[:service_record_id]
        @service_record = ServiceRecord.find(params[:service_record_id])
        @car = Car.find(@service_record.car_id)
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @document = @service_record.documents.find(params[:id])
          @document.update!(document_params)

          respond_with @document
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @document = @service_record.documents.find(params[:id])
          @document.update!(document_params)

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
      elsif params[:service_record_id]
        @service_record = ServiceRecord.find(params[:service_record_id])
        @car = Car.find(@service_record.car_id)
        if @car.owner_type == 'User'
          raise NotPrivileged unless @car.owner_id == @current_user.id
          @document = @service_record.documents.find(params[:id])
          @document.destroy!

          respond_with @document
        elsif @car.owner_type == 'Group'
          @group = Group.find(@car.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @document = @service_record.documents.find(params[:id])
          @document.destroy!

          respond_with @document
        end
      end
    end

    private

    def document_params
      params.required(:document).permit(:name, :media)
    end
  end
end
