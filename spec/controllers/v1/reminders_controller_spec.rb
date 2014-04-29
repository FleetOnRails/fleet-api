require 'spec_helper'

describe V1::RemindersController do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:token) { double :accessible? => true, :resource_owner_id => user.id }
  let(:car) { FactoryGirl.create :car }
  let(:reminder) { FactoryGirl.create :reminder }

  before :each do
    controller.stub(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  describe 'GET index' do
    before :each do
      user.cars << car
      car.reminders << reminder
    end

    it 'Should populate a list of reminders' do
      get :index, car_id: car.id

      expect(json).to have_key('reminders')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/reminders/index'
    end
  end

  describe 'GET show' do
    before :each do
      user.cars << car
      car.reminders << reminder
    end

    it 'Should populate a reminder' do
      get :show, car_id: car.id, id: reminder.id

      expect(json).to have_key('reminder')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/reminders/show'
    end
  end

  describe 'POST create' do
    before :each do
      user.cars << car
    end

    describe 'When valid params are present' do
      it 'Should create a reminder' do
        post :create, car_id: car.id, :reminder => FactoryGirl.attributes_for(:reminder)

        expect(json).to have_key('reminder')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/reminders/create'
      end
    end

    describe 'When invalid params are present' do
      it 'Should not create a reminder' do
        post :create, car_id: car.id, :reminder => FactoryGirl.attributes_for(:product)

        expect(response.status).to eq(400)
        expect(response).to render_template 'v1/errors/record_invalid'
      end
    end
  end

  describe 'PUT update' do
    before :each do
      user.cars << car
      car.reminders << reminder
    end

    it 'Should update a reminder' do
      put :update, car_id: car.id, id: reminder.id, :reminder => FactoryGirl.attributes_for(:reminder)

      expect(json).to have_key('reminder')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/reminders/update'
    end
  end

  describe 'DELETE destroy' do
    before :each do
      user.cars << car
      car.reminders << reminder
    end

    it 'Should delete a reminder' do
      delete :destroy, car_id: car.id, id: reminder.id

      expect(json).to have_key('reminder')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/reminders/destroy'
    end
  end
end
