require 'spec_helper'

describe Product do
  it 'should belong to productable' do
    should belong_to(:productable)
  end

  it 'should validate presence of name' do
    should validate_presence_of(:name)
  end

  it 'should validate presence of price' do
    should validate_presence_of(:price)
  end

  it 'should validate presence of part no' do
    should validate_presence_of(:part_no)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.build(:product)).to be_valid
  end
end
