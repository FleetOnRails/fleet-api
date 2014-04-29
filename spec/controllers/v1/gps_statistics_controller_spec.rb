require 'spec_helper'

describe V1::GpsStatisticsController do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:token) { double :accessible? => true, :resource_owner_id => user.id }
  let(:car) { FactoryGirl.create :car }
  let(:gps_statistic) { FactoryGirl.create :gps_statistic }

  before :each do
    controller.stub(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  describe 'GET index' do
    before :each do
      user.cars << car
      car.gps_statistics << gps_statistic
    end

    it 'Should populate a list of gps statistics' do
      get :index, car_id: car.id

      expect(json).to have_key('gps_statistics')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/gps_statistics/index'
    end
  end

  describe 'GET show' do
    before :each do
      user.cars << car
      car.gps_statistics << gps_statistic
    end

    it 'Should populate a gps statistic' do
      get :show, car_id: car.id, id: gps_statistic.id

      expect(json).to have_key('gps_statistic')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/gps_statistics/show'
    end
  end

  describe 'POST create' do
    before :each do
      user.cars << car
    end

    describe 'When valid params are present' do
      it 'Should populate a gps statistic' do
        post :create, car_id: car.id, :gps_statistic => FactoryGirl.attributes_for(:gps_statistic)

        expect(json).to have_key('gps_statistic')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/gps_statistics/create'
      end
    end

    describe 'When invalid params are present' do
      it 'Should populate a gps statistic' do
        post :create, car_id: car.id, :gps_statistic => FactoryGirl.attributes_for(:user)

        expect(response.status).to eq(400)
        expect(response).to render_template 'v1/errors/record_invalid'
      end
    end
  end
end
