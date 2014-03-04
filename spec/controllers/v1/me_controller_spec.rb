require 'spec_helper'

describe V1::MeController do
  render_views

  let(:token) { double :accessible? => true, :resource_owner_id => 1 }

  before :each do
    controller.stub(:doorkeeper_token) { token }
  end

  describe 'Get #index' do
    it 'responds with 200' do
      get :index, :format => :json
      response.status.should eq(200)
    end

    it 'returns a me object' do
      get :index, :format => :json
      json.should have_key('me')
    end
  end
end
