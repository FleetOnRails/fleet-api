require 'spec_helper'

describe V1::GroupsController do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:group) { FactoryGirl.create :group }
  let(:token) { double :accessible? => true, :resource_owner_id => user.id }

  before :each do
    controller.stub(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  describe 'GET index' do
    before :each do
      group.add_owner user
    end

    it 'Should populate a list of groups' do
      get :index

      expect(json).to have_key('groups')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/groups/index'
    end
  end

  describe 'GET show' do
    before :each do
      group.add_owner user
    end

    it 'Should populate a group' do
      get :show, id: group.id

      expect(json).to have_key('group')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/groups/show'
    end
  end

  describe 'POST create' do
    describe 'When valid params are present' do
      it 'Should create a group' do
        post :create, :group => FactoryGirl.attributes_for(:group)

        expect(json).to have_key('group')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/groups/create'
      end
    end

    describe 'When invalid params are present' do
      it 'Should not create a group' do
        post :create, :group => FactoryGirl.attributes_for(:user)

        expect(response.status).to eq(400)
        expect(response).to render_template 'v1/errors/record_invalid'
      end
    end
  end

  describe 'PUT update' do
    before :each do
      group.add_owner user
    end

    it 'Should update a group' do
      put :update, id: group.id, :group => FactoryGirl.attributes_for(:group)

      expect(json).to have_key('group')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/groups/update'
    end
  end

  describe 'DELETE destroy' do
    before :each do
      group.add_owner user
    end

    it 'Should destroy a group' do
      delete :destroy, id: group.id

      expect(json).to have_key('group')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/groups/destroy'
    end
  end
end
