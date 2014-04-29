require 'spec_helper'

describe V1::ProductsController do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:token) { double :accessible? => true, :resource_owner_id => user.id }
  let(:vendor) { FactoryGirl.create :vendor }
  let(:product) { FactoryGirl.create :product }

  before :each do
    controller.stub(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  describe 'GET index' do
    before :each do
      user.vendors << vendor
      vendor.products << product
    end

    it 'Should populate a list of products' do
      get :index, vendor_id: vendor.id

      expect(json).to have_key('products')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/products/index'
    end
  end

  describe 'GET show' do
    before :each do
      user.vendors << vendor
      vendor.products << product
    end

    it 'Should populate a product' do
      get :show, vendor_id: vendor.id, id: product.id

      expect(json).to have_key('product')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/products/show'
    end
  end

  describe 'POST create' do
    before :each do
      user.vendors << vendor
    end

    describe 'When valid params are present' do
      it 'Should create a new product' do
        post :create, vendor_id: vendor.id, :product => FactoryGirl.attributes_for(:product)

        expect(json).to have_key('product')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/products/create'
      end
    end

    describe 'When invalid params are present' do
      it 'Should create a new product' do
        post :create, vendor_id: vendor.id, :product => FactoryGirl.attributes_for(:vendor)

        expect(response.status).to eq(400)
        expect(response).to render_template 'v1/errors/record_invalid'
      end
    end
  end

  describe 'PUT update' do
    before :each do
      user.vendors << vendor
      vendor.products << product
    end

    it 'Should update a product' do
      put :update, vendor_id: vendor.id, id: product.id, :product => FactoryGirl.attributes_for(:product)

      expect(json).to have_key('product')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/products/update'
    end
  end

  describe 'DELETE destroy' do
    before :each do
      user.vendors << vendor
      vendor.products << product
    end

    it 'Should update a product' do
      delete :destroy, vendor_id: vendor.id, id: product.id

      expect(json).to have_key('product')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/products/destroy'
    end
  end
end
