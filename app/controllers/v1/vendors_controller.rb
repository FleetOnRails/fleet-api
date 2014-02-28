module V1
  class VendorsController < BaseController
    doorkeeper_for [:all]

    def index
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @vendors = @group.vendors

        respond_with @vendors
      else
        @vendors = @current_user.vendors

        respond_with @vendors
      end
    end

    def show
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @vendor = @group.vendors.find(params[:id])

        respond_with @vendor
      else
        @vendor = @current_user.vendors.find(params[:id])

        respond_with @vendor
      end
    end

    def create
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @vendor = Vendor.create!(vendor_params)
        @location = Location.create!(location_params)
        @vendor.location = @location
        @group.vendors <<(@vendor)
        @group.save!

        respond_with @vendor
      else
        @vendor = Vendor.create!(vendor_params)
        @location = Location.create!(location_params)
        @vendor.location = @location
        @current_user.vendors <<(@vendor)
        @current_user.save!

        respond_with @vendor
      end
    end

    def update
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @vendor = @group.vendors.find(params[:id])
        @vendor.location.update!(location_params)
        @vendor.update!(vendor_params)

        respond_with @vendor
      else
        @vendor = @current_user.vendors.find(params[:id])
        @vendor.location.update!(location_params)
        @vendor.update!(vendor_params)

        respond_with @vendor
      end
    end

    def destroy
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @vendor = @group.vendors.find(params[:id])
        @vendor.destroy!

        respond_with @vendor
      else
        @vendor = @current_user.vendors.find(params[:id])
        @vendor.destroy!

        respond_with @vendor
      end
    end

    private

    def vendor_params
      params.required(:vendor).permit(:name, :supplies)
    end

    def location_params
      params.required(:location).permit(:latitude, :longitude, :address)
    end
  end
end
