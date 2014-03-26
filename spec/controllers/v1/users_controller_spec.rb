require 'spec_helper'

describe V1::UsersController do
  render_views

  let(:user) { FactoryGirl.create(:user) }
  let(:group) { FactoryGirl.create(:group) }
  let(:group_user) { FactoryGirl.create(:user) }

  # TODO - There has to be a way to get these attributes from a factory
  let(:valid_params) { {:user => {:first_name => 'alan', :last_name => 'kehoe', :username => 'alankehoe',
                                  :email => '12124234dfhvsdfhvjh@coolmail.com', :password => 'password',
                                  :password_confirmation => 'password'}} }
  let(:invalid_params) { {:user => {:first_name => 'alan', :last_name => 'kehoe', :username => 'alankehoe',
                                    :email => '12124234dfhvsdfhvjh@coolmail.com'}} }

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

      describe 'When a group is scoped' do
        it 'should index the users of the group id current user is a member' do
          group.add_user(@current_user, REPORTER)
          get :index, {group_id: group.id}

          expect(json).to have_key('users')
          expect(response.status).to eq(200)
          expect(response).to render_template 'v1/users/index'
        end

        it 'should render not privileged if not a member' do
          get :index, {group_id: group.id}

          expect(response.status).to eq(403)
          expect(response).to render_template 'v1/errors/not_privileged'
        end
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

    describe 'When a group is scoped' do

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

    describe 'When a group is scoped' do
      before :each do
        bypass_authentication
      end

      it 'add user to group if current user is an owner' do
        group.add_owner(@current_user)

        get :create, {group_id: group.id, :user => {user_id: group_user.id, group_access: REPORTER}}

        expect(json).to have_key('user')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/users/create'
      end

      it 'add user to group if current user is an manager' do
        group.add_user(@current_user, MANAGER)

        get :create, {group_id: group.id, :user => {user_id: group_user.id, group_access: REPORTER}}

        expect(json).to have_key('user')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/users/create'
      end

      it 'should raise not privileged if the current user is a driver or reporter' do
        [DRIVER, REPORTER].each do |access|
          group.users.delete(user)
          group.users.delete(@current_user)
          group.add_user(@current_user, access)

          get :create, {group_id: group.id, :user => {user_id: group_user.id, group_access: REPORTER}}

          expect(response.status).to eq(403)
          expect(response).to render_template 'v1/errors/not_privileged'
        end
      end

      it 'should raise record invalid if already a member' do
        group.add_owner(@current_user)

        get :create, {group_id: group.id, :user => {user_id: @current_user.id, group_access: REPORTER}}

        expect(response.status).to eq(400)
        expect(response).to render_template 'v1/errors/record_invalid'
      end
    end
  end
end


