require 'spec_helper'

describe V1::DiagnosticStatisticsController do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:token) { double :accessible? => true, :resource_owner_id => user.id }
  let(:car) { FactoryGirl.create :car }
  let(:diagnostic_statistic) { FactoryGirl.create :diagnostic_statistic }

  before :each do
    controller.stub(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  describe 'GET index' do
    before :each do
      user.cars << car
      car.diagnostic_statistics << diagnostic_statistic
    end

    it 'Should populate a list of diagnostic statistics' do
      get :index, car_id: car.id

      expect(json).to have_key('diagnostic_statistics')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/diagnostic_statistics/index'
    end
  end

  describe 'GET show' do
    before :each do
      user.cars << car
      car.diagnostic_statistics << diagnostic_statistic
    end

    it 'Should populate a diagnostic statistics' do
      get :show, car_id: car.id, id: diagnostic_statistic.id

      expect(json).to have_key('diagnostic_statistic')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/diagnostic_statistics/show'
    end
  end

  describe 'POST create' do
    before :each do
      user.cars << car
    end

    describe 'When valid params are present' do
      it 'Should create a diagnostic statistics' do
        post :create, car_id: car.id, :diagnostic_statistic => FactoryGirl.attributes_for(:diagnostic_statistic)

        puts response.body
        expect(json).to have_key('diagnostic_statistic')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/diagnostic_statistics/create'
      end
    end

    describe 'When invalid params are present' do
      it 'Should create a diagnostic statistics' do
        post :create, car_id: car.id, :diagnostic_statistic => FactoryGirl.attributes_for(:diagnostic_fault)

        expect(response.status).to eq(400)
        expect(response).to render_template 'v1/errors/record_invalid'
      end
    end
  end
end
