require 'spec_helper'

describe V1::MeController do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:token) { double :accessible? => true, :resource_owner_id => user.id }

  before :each do
    controller.stub(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  describe 'GET index' do
    it 'returns a me object' do
      get :index

      expect(json).to have_key('me')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/me/index'
    end

    it 'response is successful' do
      get :index
    end
  end
end
