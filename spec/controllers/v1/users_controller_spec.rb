require 'spec_helper'

describe V1::UsersController do
  render_views

  before :each do
    bypass_authentication
  end

  describe 'GET index' do
    before :each do
      FactoryGirl.create_list(:user, 10)
    end

    it 'recieves a list of users' do
      get :index, format: :json

      expect(json).to have_key('users')
    end

    it 'response is successful' do
      get :index, format: :json

      expect(response).to be_success
    end
  end
end


