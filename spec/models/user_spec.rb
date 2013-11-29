require 'spec_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end
  it "is invalid without a firstname" do
    FactoryGirl.build(:user, first_name: nil).should_not be_valid
  end
  it "is invalid without a lastname"
  it "returns a contact's full name as a string"
end