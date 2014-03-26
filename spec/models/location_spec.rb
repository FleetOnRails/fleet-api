require 'spec_helper'

describe Location do
  it 'should belong to locationable' do
    should belong_to(:locationable)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.build(:location)).to be_valid
  end
end
