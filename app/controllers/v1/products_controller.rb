module V1
  class ProductsController < BaseController
    doorkeeper_for [:all]

    def index
      if params[:vendor_id]
        @vendor = Vendor.find(params[:vendor_id])
        if @vendor.owner_type == 'User'
          raise NotPrivileged unless @vendor.owner_id == @current_user.id
          @products = @vendor.products

          respond_with @products
        elsif @vendor.owner_type == 'Group'
          @group = Group.find(@vendor.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @products = @vendor.products

          respond_with @products
        end
      end
    end

    def show
      if params[:vendor_id]
        @vendor = Vendor.find(params[:vendor_id])
        if @vendor.owner_type == 'User'
          raise NotPrivileged unless @vendor.owner_id == @current_user.id
          @product = @vendor.products.find(params[:id])

          respond_with @product
        elsif @vendor.owner_type == 'Group'
          @group = Group.find(@vendor.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @product = @vendor.products.find(params[:id])

          respond_with @product
        end
      end
    end

    def create
      if params[:vendor_id]
        @vendor = Vendor.find(params[:vendor_id])
        if @vendor.owner_type == 'User'
          raise NotPrivileged unless @vendor.owner_id == @current_user.id
          @product = Product.create!(product_params)
          @vendor.products <<(@product)
          @vendor.save!

          respond_with @product
        elsif @vendor.owner_type == 'Group'
          @group = Group.find(@vendor.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @product = Product.create!(product_params)
          @vendor.products <<(@product)
          @vendor.save!

          respond_with @product
        end
      end
    end

    def update
      if params[:vendor_id]
        @vendor = Vendor.find(params[:vendor_id])
        if @vendor.owner_type == 'User'
          raise NotPrivileged unless @vendor.owner_id == @current_user.id
          @product = @vendor.products.find(params[:id])
          @product.update!(product_params)

          respond_with @product
        elsif @vendor.owner_type == 'Group'
          @group = Group.find(@vendor.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @product = @vendor.products.find(params[:id])
          @product.update!(product_params)

          respond_with @product
        end
      end
    end

    def destroy
      if params[:vendor_id]
        @vendor = Vendor.find(params[:vendor_id])
        if @vendor.owner_type == 'User'
          raise NotPrivileged unless @vendor.owner_id == @current_user.id
          @product = @vendor.products.find(params[:id])
          @product.destroy!

          respond_with @product
        elsif @vendor.owner_type == 'Group'
          @group = Group.find(@vendor.owner_id)
          raise NotPrivileged unless @group.is_member?(@current_user)
          @product = @vendor.products.find(params[:id])
          @product.destroy!

          respond_with @product
        end
      end
    end

    private

    def product_params
      params.required(:document).permit(:name, :price, :part_no)
    end
  end
end
