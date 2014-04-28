require 'spec_helper'

describe V1::DestinationsController do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:token) { double :accessible? => true, :resource_owner_id => user.id }
  let(:group) { FactoryGirl.create :group }
  let(:destination) { FactoryGirl.create :destination }

  before :each do
    controller.stub(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  describe 'GET index' do
    before :each do
      group.add_owner user
      group.destinations << destination
    end

    it 'Should populate a list of destinations' do
      get :index, {group_id: group.id}

      expect(json).to have_key('destinations')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/destinations/index'
    end
  end

  describe 'GET show' do
    before :each do
      group.add_owner user
      group.destinations << destination
    end

    it 'Should populate destinations' do
      get :show, {group_id: group.id, id: destination.id}

      expect(json).to have_key('destination')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/destinations/show'
    end
  end

  describe 'POST create' do
    before :each do
      group.add_owner user
      group.destinations << destination
    end

    describe 'When valid params are presented' do
      it 'assigns a new destination' do
        post :create, :group_id => group.id, :destination => FactoryGirl.nested_attributes_for(:destination)

        expect(json).to have_key('destination')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/destinations/create'
      end
    end

    describe 'When invalid params are presented' do
      it 'assigns a new destination' do
        post :create, :group_id => group.id, :destination => FactoryGirl.attributes_for(:destination)

        expect(response.status).to eq(400)
        expect(response).to render_template 'v1/errors/record_invalid'
      end
    end
  end
end
