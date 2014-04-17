require 'spec_helper'

describe V1::FuelEntriesController do
  render_views

  let(:car) { FactoryGirl.create(:car) }
  let(:fuel_entry) { FactoryGirl.create(:fuel_entry) }

  # post :create, :api_key => FactoryGirl.attributes_for(:api_key)

  before :each do
    request.accept = 'application/json'
  end

  describe 'GET index' do
    describe 'When current user is authenticated' do
      before :each do
        bypass_authentication
      end

      it 'assigns all fuel_entries to @fuel_entries' do
        get :index, :car_id => car.id

        expect(json).to have_key('fuel_entries')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/fuel_entries/index'
      end
    end

    describe 'When current user is not authenticated' do
      before :each do
        remove_authentication
      end

      it 'should render not privileged' do
        get :index, :car_id => car.id

        expect(response.status).to eq(403)
        expect(response).to render_template 'v1/errors/not_privileged'
      end
    end
  end

  describe 'GET show' do
    describe 'When current user is authenticated' do
      before :each do
        bypass_authentication
        @current_user.cars << car
        car.fuel_entries << fuel_entry
      end

      it 'assigns a fuel_entry to @fuel_entry' do
        get :show, :car_id => car.id, :id => fuel_entry.id

        expect(json).to have_key('fuel_entry')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/fuel_entries/show'
      end
    end

    describe 'When current user is not authenticated' do
      before :each do
        remove_authentication
      end

      it 'should render not privileged' do
        get :show, :car_id => car.id, :id => fuel_entry.id

        expect(response.status).to eq(403)
        expect(response).to render_template 'v1/errors/not_privileged'
      end
    end
  end

  describe 'POST create' do
    describe 'When a user is logged in' do
      before :each do
        bypass_authentication
      end

      describe 'When valid params are presented' do
        it 'assigns a new fuel entry' do
          @current_user.cars << car
          post :create, :car_id => car.id,
               :fuel_entry => FactoryGirl.attributes_for(:fuel_entry)

          expect(json).to have_key('fuel_entry')
          expect(response.status).to eq(200)
          expect(response).to render_template 'v1/fuel_entries/create'
        end
      end

      describe 'When invalid params are presented' do
        it 'does not assign a new fuel entry' do
          @current_user.cars << car
          post :create, :car_id => car.id,
               :fuel_entry => {:odometer => 100000}

          expect(response.status).to eq(400)
          expect(response).to render_template 'v1/errors/record_invalid'
        end
      end
    end

    describe 'When a user is not logged in' do
      before :each do
        remove_authentication
      end

      describe 'When valid params are presented' do
        it 'responds with not privileged' do
          post :create, :car_id => car.id,
               :fuel_entry => FactoryGirl.attributes_for(:fuel_entry)

          expect(response.status).to eq(403)
          expect(response).to render_template 'v1/errors/not_privileged'
        end
      end
    end
  end
end
