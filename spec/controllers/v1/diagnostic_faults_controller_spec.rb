require 'spec_helper'

describe V1::DiagnosticFaultsController do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:token) { double :accessible? => true, :resource_owner_id => user.id }
  let(:car) { FactoryGirl.create :car }
  let(:diagnostic_fault) { FactoryGirl.create :diagnostic_fault }

  before :each do
    controller.stub(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  describe 'GET index' do
    before :each do
      user.cars << car
      car.diagnostic_faults << diagnostic_fault
    end

    it 'Should populate a list of diagnostic faults' do
      get :index, car_id: car.id

      expect(json).to have_key('diagnostic_faults')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/diagnostic_faults/index'
    end
  end

  describe 'GET show' do
    before :each do
      user.cars << car
      car.diagnostic_faults << diagnostic_fault
    end

    it 'Should populate a diagnostic faults' do
      get :show, car_id: car.id, id: diagnostic_fault.id

      expect(json).to have_key('diagnostic_fault')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/diagnostic_faults/show'
    end
  end

  describe 'POST create' do
    before :each do
      user.cars << car
    end

    describe 'When valid params are present' do
      it 'Should create a diagnostic faults' do
        post :create, car_id: car.id, :diagnostic_fault => FactoryGirl.attributes_for(:diagnostic_fault)

        expect(json).to have_key('diagnostic_fault')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/diagnostic_faults/create'
      end
    end

    describe 'When invalid params are present' do
      it 'Should create a diagnostic faults' do
        post :create, car_id: car.id, :diagnostic_fault => FactoryGirl.attributes_for(:diagnostic_statistic)

        expect(response.status).to eq(400)
        expect(response).to render_template 'v1/errors/record_invalid'
      end
    end
  end

  describe 'PUT update' do
    before :each do
      user.cars << car
      car.diagnostic_faults << diagnostic_fault
    end

    it 'Should update a diagnostic faults' do
      put :update, car_id: car.id, id: diagnostic_fault.id, :diagnostic_fault => FactoryGirl.attributes_for(:diagnostic_fault)

      expect(json).to have_key('diagnostic_fault')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/diagnostic_faults/update'
    end
  end
end
