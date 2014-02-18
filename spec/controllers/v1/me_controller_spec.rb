require 'spec_helper'

describe V1::MeController do

  before :each do
    controller.stub(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  describe 'GET #index' do
    it 'responds with 200' do
      get :index
      response.status.should eq(200)
    end
  end

  #describe "GET 'index'" do
  #  before { get :index }
  #
  #  it 'Renders the api/v1/me/index view' do
  #    should render_template('api/v1/me/index')
  #  end
  #end
  #
  #describe "GET 'update'" do
  #  it "returns http success" do
  #    pending("something else getting finished")
  #    this_should_not_get_executed
  #  end
  #end
  #
  #describe "POST 'update'" do
  #  before { post :update }
  #
  #  it 'Renders the api/v1/me/update view' do
  #    should render_template('api/v1/me/update')
  #  end
  #end

end
