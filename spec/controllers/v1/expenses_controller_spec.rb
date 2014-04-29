require 'spec_helper'

describe V1::ExpensesController do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:token) { double :accessible? => true, :resource_owner_id => user.id }
  let(:car) { FactoryGirl.create :car }
  let(:expense) { FactoryGirl.create :expense }

  before :each do
    controller.stub(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  describe 'GET index' do
    before :each do
      user.cars << car
      car.expenses << expense
    end

    it 'Should populate a list of expenses' do
      get :index, car_id: car.id

      expect(json).to have_key('expenses')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/expenses/index'
    end
  end

  describe 'GET show' do
    before :each do
      user.cars << car
      car.expenses << expense
    end

    it 'Should populate an expenses' do
      get :show, car_id: car.id, id: expense.id

      expect(json).to have_key('expense')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/expenses/show'
    end
  end

  describe 'POST create' do
    before :each do
      user.cars << car
    end

    describe 'When valid params are present' do
      it 'Should create an expense' do
        post :create, car_id: car.id, :expense => FactoryGirl.nested_attributes_for(:expense)

        expect(json).to have_key('expense')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/expenses/create'
      end
    end

    describe 'When invalid params are present' do
      it 'Should create an expense' do
        post :create, car_id: car.id, :expense => FactoryGirl.attributes_for(:expense)

        expect(response.status).to eq(400)
        expect(response).to render_template 'v1/errors/record_invalid'
      end
    end
  end

  describe 'PUT create' do
    before :each do
      user.cars << car
      car.expenses << expense
    end

    it 'Should update an expense' do
      put :update, car_id: car.id, id: expense.id, :expense => FactoryGirl.nested_attributes_for(:expense)

      expect(json).to have_key('expense')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/expenses/update'
    end
  end

  describe 'DELETE destroy' do
    before :each do
      user.cars << car
      car.expenses << expense
    end

    it 'Should delete an expense' do
      delete :destroy, car_id: car.id, id: expense.id

      expect(json).to have_key('expense')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/expenses/destroy'
    end
  end
end
