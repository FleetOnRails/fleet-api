module V1
  class DocumentsController < BaseController
    doorkeeper_for [:all]

    include DocumentsHelper

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
      end
    end

    def create
      if params[:document][:document_data] && params[:document][:document_extension]
        if params[:car_id]
          @car = Car.find(params[:car_id])
          if @car.owner_type == 'User'
            raise NotPrivileged unless @car.owner_id == @current_user.id
            @document = Document.new(document_params)
            @document.media = build_media(params[:document][:document_data], params[:document][:document_extension])
            @document.save!
            @car.documents <<(@document)
            @car.save!

            respond_with @document
          elsif @car.owner_type == 'Group'
            @group = Group.find(@car.owner_id)
            raise NotPrivileged unless @group.is_member?(@current_user)
            @document = Document.new(document_params)
            @document.media = build_media(params[:document][:document_data], params[:document][:document_extension])
            @document.save!
            @car.documents <<(@document)
            @car.save!

            respond_with @document
          end
        end
      end
    end

    def update
      if params[:document][:document_data] && params[:document][:document_extension]
        if params[:car_id]
          @car = Car.find(params[:car_id])
          if @car.owner_type == 'User'
            raise NotPrivileged unless @car.owner_id == @current_user.id
            @document = @car.documents.find(params[:id])
            @document.update!(document_params)
            @document.media = build_media(params[:document][:document_data], params[:document][:document_extension])
            @document.save!

            respond_with @document
          elsif @car.owner_type == 'Group'
            @group = Group.find(@car.owner_id)
            raise NotPrivileged unless @group.is_member?(@current_user)
            @document = @car.documents.find(params[:id])
            @document.update!(document_params)
            @document.media = build_media(params[:document][:document_data], params[:document][:document_extension])
            @document.save!

            respond_with @document
          end
        end
      else
        if params[:car_id]
          @car = Car.find(params[:car_id])
          if @car.owner_type == 'User'
            raise NotPrivileged unless @car.owner_id == @current_user.id
            @document = @car.documents.find(params[:id])
            @document.update!(document_params)
            @document.save!

            respond_with @document
          elsif @car.owner_type == 'Group'
            @group = Group.find(@car.owner_id)
            raise NotPrivileged unless @group.is_member?(@current_user)
            @document = @car.documents.find(params[:id])
            @document.update!(document_params)
            @document.save!

            respond_with @document
          end
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
      end
    end

    private

    def document_params
      params.required(:document).permit(:name)
    end
  end
end