require 'spec_helper'

describe User do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it 'is invalid without a first name' do
    expect(FactoryGirl.build(:user, first_name: nil)).to have(1).errors_on(:first_name)
  end

  it 'is invalid without a last name' do
    expect(FactoryGirl.build(:user, last_name: nil)).to have(1).errors_on(:last_name)
  end
end