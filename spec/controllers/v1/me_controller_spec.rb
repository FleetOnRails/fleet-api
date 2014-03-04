require 'spec_helper'

describe V1::MeController do
  render_views

  before(:all) do
    fixtures :user
  end

  let(:token) { double :accessible? => true, :resource_owner_id => 1 }

  before :each do
    controller.stub(:doorkeeper_token) { token }
  end

  it 'responds with 200' do
    get :index
    puts response.body
    response.status.should eq(200)
  end
end
