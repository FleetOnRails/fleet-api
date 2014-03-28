require 'spec_helper'

describe Document do
  it 'should belong to documentable' do
    should belong_to(:documentable)
  end

  it 'should validate presence of name' do
    should validate_presence_of(:name)
  end

  it 'should validate presence of media' do
    should validate_presence_of(:media)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.build(:document)).to be_valid
  end
end
