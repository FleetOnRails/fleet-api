require 'spec_helper'

describe Api::V1::UserController do

  describe "GET index" do
    it "populates an array of users" do
      user = FactoryGirl.create(:user)
      get :index
      assigns(:users).should eq([user])
    end

    it "renders the :index view" do
      get :index
      response.should
      render_template :index
    end

    it "returns http success" do
      get :index
      response.should be_success
    end
  end

  describe "GET show" do
    it "assigns the requested user to @user" do
      user = FactoryGirl.create(:user)
      get :show, id: user.id
      assigns(:user).should eq(user)
    end

    it "renders the :show view" do
      user = FactoryGirl.create(:user)
      get :show, id: user.id
      response.should
      render_template :show
    end

    it "returns http success" do
      user = FactoryGirl.create(:user)
      get :show, id: user.id
      response.should be_success
    end
  end

  describe "POST create" do
    it "returns http success" do
      user = FactoryGirl.attributes_for(:user)
      post :create, user: user
      response.should be_success
    end

    it "renders the :create view" do
      user = FactoryGirl.attributes_for(:user)
      post :create, user: user
      response.should
      render_template :create
    end
  end

  describe "PUT update" do
    it "returns http success" do
      pending("something else getting finished")
      this_should_not_get_executed
    end
  end

  describe "POST delete" do
    it "returns http success" do
      pending("something else getting finished")
      this_should_not_get_executed
    end
  end

end


