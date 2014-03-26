require 'spec_helper'

describe V1::UsersController do
  render_views

  let(:user) { FactoryGirl.create(:user) }

  # TODO - There has to be a way to get these attributes from a factory
  let(:valid_params) { {:user => {:first_name => 'alan', :last_name => 'kehoe', :username => 'alankehoe',
                                  :email => 'alankehoe111@gmail.com', :password => 'password',
                                  :password_confirmation => 'password'}} }
  let(:invalid_params) { {:user => {:first_name => 'alan', :last_name => 'kehoe', :username => 'alankehoe',
                                    :email => 'alankehoe111@gmail.com'}} }

  before :each do
    request.accept = 'application/json'
  end

  describe 'GET index' do
    describe 'When current user is authenticated' do
      before :each do
        bypass_authentication
      end

      it 'assigns all users to @users' do
        get :index

        expect(json).to have_key('users')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/users/index'
      end
    end

    describe 'When current user is not authenticated' do
      before :each do
        remove_authentication
      end

      it 'should not assign the requested user to @users' do
        get :index

        expect(response.status).to eq(403)
        expect(response).to render_template 'v1/errors/not_privileged'
      end
    end
  end

  describe 'GET show' do
    describe 'When current user is authenticated' do
      before :each do
        bypass_authentication
      end

      it 'assigns the requested user to @user' do
        get :show, id: user

        expect(json).to have_key('user')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/users/show'
      end
    end

    describe 'When current user is not authenticated' do
      before :each do
        remove_authentication
      end

      it 'should not assign the requested user to @user' do
        get :show, id: user

        expect(response.status).to eq(403)
        expect(response).to render_template 'v1/errors/not_privileged'
      end
    end
  end

  describe 'PUT update' do
  end

  describe 'POST create' do
    describe 'When valid params are presented' do
      it 'assigns a new User' do
        post :create, valid_params

        expect(json).to have_key('user')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/users/create'
      end
    end

    describe 'When invalid params are presented' do
      it 'does not assign a new User' do
        post :create, invalid_params

        expect(response.status).to eq(400)
        expect(response).to render_template 'v1/errors/record_invalid'
      end
    end
  end
end


