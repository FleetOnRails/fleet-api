require 'spec_helper'

describe V1::MeController do
  render_views

  before :each do
    bypass_authentication
  end

  describe 'GET index' do
    it 'returns a me object' do
      get :index, format: :json
      puts json
      expect(json).to have_key('me')
    end

    it 'response is successful' do
      get :index, format: :json
    end
  end
end
