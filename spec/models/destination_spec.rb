require 'spec_helper'

describe Destination do
  it 'should belong to destinationable' do
    should belong_to(:destinationable)
  end

  it 'should have one locations' do
    should have_one(:location)
  end

  it 'should validate presence of name' do
    should validate_presence_of(:name)
  end

  it 'should validate presence of location' do
    should validate_presence_of(:location)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.build(:destination)).to be_valid
  end
end
