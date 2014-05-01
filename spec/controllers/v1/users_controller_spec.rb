require 'spec_helper'

describe V1::UsersController do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:token) { double :accessible? => true, :resource_owner_id => user.id }
  let(:group) { FactoryGirl.create(:group) }
  let(:group_user) { FactoryGirl.create(:user) }

  before :each do
    controller.stub(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  # TODO - There has to be a way to get these attributes from a factory
  let(:valid_params) { {:user => {:first_name => 'alan', :last_name => 'kehoe', :username => 'alankehoe',
                                  :email => '12124234dfhvsdfhvjh@coolmail.com', :password => 'password',
                                  :password_confirmation => 'password'}} }
  let(:invalid_params) { {:user => {:first_name => 'alan', :last_name => 'kehoe', :username => 'alankehoe',
                                    :email => '12124234dfhvsdfhvjh@coolmail.com'}} }

  describe 'GET index' do
    it 'assigns all users to @users' do
      get :index

      expect(json).to have_key('users')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/users/index'
    end

    describe 'When a group is scoped' do
      it 'should index the users of the group id current user is a member' do
        group.add_user(user, REPORTER)
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

  describe 'GET show' do
    it 'assigns the requested user to @user' do
      get :show, id: user

      expect(json).to have_key('user')
      expect(response.status).to eq(200)
      expect(response).to render_template 'v1/users/show'
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
      it 'add user to group if current user is an owner' do
        group.add_owner(user)

        get :update, {group_id: group.id, id: group_user.id, :user => {group_access: REPORTER}}

        expect(json).to have_key('user')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/users/update'
      end

      it 'add user to group if current user is an manager' do
        group.add_user(user, MANAGER)

        put :update, {group_id: group.id, id: group_user.id, :user => {group_access: REPORTER}}

        expect(json).to have_key('user')
        expect(response.status).to eq(200)
        expect(response).to render_template 'v1/users/update'
      end

      it 'should raise not privileged if the current user is a driver or reporter' do
        [DRIVER, REPORTER].each do |access|
          group.users.delete(user)
          group.add_user(user, access)

          get :update, {group_id: group.id, id: group_user.id, :user => {group_access: REPORTER}}

          expect(response.status).to eq(403)
          expect(response).to render_template 'v1/errors/not_privileged'
        end
      end

      it 'should raise record invalid if already a member' do
        group.add_owner(user)

        get :create, {group_id: group.id, :user => {user_id: user.id, group_access: REPORTER}}

        expect(response.status).to eq(400)
        expect(response).to render_template 'v1/errors/record_invalid'
      end
    end
  end
end


