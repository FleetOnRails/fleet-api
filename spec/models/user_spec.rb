require 'spec_helper'

describe User do
  it 'has a valid factory' do
    #expect(FactoryGirl.create(:user)).to be_valid
    pending("something else getting finished")
    this_should_not_get_executed
  end

  it 'is invalid without a first name' do
    #expect(FactoryGirl.build(:user, first_name: nil)).to have(1).errors_on(:first_name)
    pending("something else getting finished")
    this_should_not_get_executed
  end

  it 'is invalid without a last name' do
    #expect(FactoryGirl.build(:user, last_name: nil)).to have(1).errors_on(:last_name)
    pending("something else getting finished")
    this_should_not_get_executed
  end
end
