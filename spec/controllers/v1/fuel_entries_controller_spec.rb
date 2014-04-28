require 'spec_helper'

describe V1::FuelEntriesController do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:car) { FactoryGirl.create :car }
  let(:fuel_entry) { FactoryGirl.create :fuel_entry }
  let(:token) { double :accessible? => true, :resource_owner_id => user.id }

  # post :create, :api_key => FactoryGirl.attributes_for(:api_key)

  before :each do
    controller.stub(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  describe 'GET index' do
    describe 'When current user is authenticated' do
      it 'assigns all fuel_entries to @fuel_entries' do
        get :index, :car_id => car.id

        expect(json).to have_key('fuel_entries')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/fuel_entries/index'
      end
    end
  end

  describe 'GET show' do
    before :each do
      user.cars << car
      car.fuel_entries << fuel_entry
    end

    it 'assigns a fuel_entry to @fuel_entry' do
      get :show, :car_id => car.id, :id => fuel_entry.id

      # expect(json).to have_key('fuel_entry')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/fuel_entries/show'
    end
  end

  describe 'POST create' do
    describe 'When valid params are presented' do
      it 'assigns a new fuel entry' do
        user.cars << car
        post :create, :car_id => car.id, :fuel_entry => FactoryGirl.attributes_for(:fuel_entry)

        expect(json).to have_key('fuel_entry')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/fuel_entries/create'
      end
    end

    describe 'When invalid params are presented' do
      it 'does not assign a new fuel entry' do
        user.cars << car
        post :create, :car_id => car.id, :fuel_entry => {:odometer => 100000}

        expect(response.status).to eq(400)
        expect(response).to render_template 'v1/errors/record_invalid'
      end
    end
  end
end
