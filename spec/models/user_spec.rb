require 'spec_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  it "is invalid without a firstname" do
    FactoryGirl.build(:user, first_name: nil).should_not be_valid
  end

  it "is invalid without a lastname" do
    FactoryGirl.build(:user, last_name: nil).should_not be_valid
  end

  it "returns a user's full name as a string" do
    @user = FactoryGirl.create(:user, first_name: 'Alan', last_name: 'Kehoe')
    @user.name.should == 'Alan Kehoe'
  end
end