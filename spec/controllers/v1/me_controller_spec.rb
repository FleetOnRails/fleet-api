require 'spec_helper'

describe V1::MeController do
  render_views

  before :each do
    bypass_authentication
  end

  describe 'GET index' do
    it 'returns a me object' do
      get :index, format: :json

      expect(json).to have_key('me')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/me/index'
    end

    it 'response is successful' do
      get :index, format: :json
    end
  end
end
