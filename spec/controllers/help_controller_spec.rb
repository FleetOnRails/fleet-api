require 'spec_helper'

describe HelpController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'api'" do
    it "returns http success" do
      get 'api'
      response.should be_success
    end
  end

end
