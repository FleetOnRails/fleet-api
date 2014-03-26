require 'spec_helper'

describe UserGroup do
  it 'should belong to user' do
    should belong_to(:user)
  end

  it 'should belong to user' do
    should belong_to(:group)
  end

  it 'should validate presence of user id' do
    should validate_presence_of(:user_id)
  end

  it 'should validate presence of group id' do
    should validate_presence_of(:group_id)
  end

  it 'should validate presence of group access' do
    should validate_presence_of(:group_access)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.build(:user_group)).to be_valid
  end
end
