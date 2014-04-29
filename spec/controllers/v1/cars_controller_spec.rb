require 'spec_helper'

describe V1::CarsController do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:token) { double :accessible? => true, :resource_owner_id => user.id }
  let(:car) { FactoryGirl.create :car }

  before :each do
    controller.stub(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  describe 'GET index' do
    before :each do
      user.cars << car
    end

    it 'Should populate a list of cars' do
      get :index

      expect(json).to have_key('cars')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/cars/index'
    end
  end

  describe 'GET show' do
    before :each do
      user.cars << car
    end

    it 'Should populate a car' do
      get :show, id: car.id

      expect(json).to have_key('car')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/cars/show'
    end
  end

  describe 'POST create' do
    describe 'When valid params are present' do
      it 'Should create a car' do
        post :create, :car => FactoryGirl.attributes_for(:car)

        expect(json).to have_key('car')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/cars/create'
      end
    end

    describe 'When invalid params are present' do
      it 'Should not create a car' do
        post :create, :car => FactoryGirl.attributes_for(:user)

        expect(response.status).to eq(400)
        expect(response).to render_template 'v1/errors/record_invalid'
      end
    end
  end

  describe 'PUT update' do
    before :each do
      user.cars << car
    end

    it 'Should update a car' do
      put :update, id: car.id, :car => FactoryGirl.attributes_for(:car)

      expect(json).to have_key('car')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/cars/update'
    end
  end

  describe 'DELETE destroy' do
    before :each do
      user.cars << car
    end

    it 'Should destroy a car' do
      delete :destroy, id: car.id

      expect(json).to have_key('car')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/cars/destroy'
    end
  end
end
