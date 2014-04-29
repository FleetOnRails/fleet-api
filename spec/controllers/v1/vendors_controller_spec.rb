require 'spec_helper'

describe V1::VendorsController do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:token) { double :accessible? => true, :resource_owner_id => user.id }
  let(:vendor) { FactoryGirl.create :vendor }

  before :each do
    controller.stub(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  describe 'GET index' do
    before :each do
      user.vendors << vendor
    end

    it 'Should populate a list of vendors' do
      get :index

      expect(json).to have_key('vendors')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/vendors/index'
    end
  end

  describe 'GET show' do
    before :each do
      user.vendors << vendor
    end

    it 'Should a vendor' do
      get :show, id: vendor.id

      expect(json).to have_key('vendor')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/vendors/show'
    end
  end

  describe 'POST create' do
    before :each do
      user.vendors << vendor
    end

    describe 'When valid params are present' do
      it 'Should create a vendor' do
        post :create, :vendor => FactoryGirl.nested_attributes_for(:vendor)

        expect(json).to have_key('vendor')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/vendors/create'
      end
    end

    describe 'When invalid params are present' do
      it 'Should create a vendor' do
        post :create, :vendor => FactoryGirl.nested_attributes_for(:product)

        expect(response.status).to eq(400)
        expect(response).to render_template 'v1/errors/record_invalid'
      end
    end
  end

  describe 'PUT update' do
    before :each do
      user.vendors << vendor
    end

    it 'Should a vendor' do
      put :update, id: vendor.id, :vendor => FactoryGirl.nested_attributes_for(:vendor)

      expect(json).to have_key('vendor')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/vendors/update'
    end
  end

  describe 'DELETE destroy' do
    before :each do
      user.vendors << vendor
    end

    it 'Should a vendor' do
      delete :destroy, id: vendor.id

      expect(json).to have_key('vendor')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/vendors/destroy'
    end
  end
end
