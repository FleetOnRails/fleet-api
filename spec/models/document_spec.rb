require 'spec_helper'

describe Document do
  it 'should belong to documentable' do
    should belong_to(:documentable)
  end

  it 'should validate presence of title' do
    should validate_presence_of(:title)
  end

  it 'should validate presence of data' do
    should validate_presence_of(:data)
  end

  it 'should validate presence of file' do
    should validate_presence_of(:file)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.build(:document)).to be_valid
  end
end
