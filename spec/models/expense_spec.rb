require 'spec_helper'

describe Expense do
  it 'should belong to car' do
    should belong_to(:car)
  end

  it 'should have many documents' do
    should have_many(:documents)
  end

  it 'should validate presence of odometer reading' do
    should validate_presence_of(:odometer)
  end

  it 'should validate presence of date' do
    should validate_presence_of(:date)
  end

  it 'should validate presence of price' do
    should validate_presence_of(:price)
  end

  it 'should validate presence of type' do
    should validate_presence_of(:type)
  end

  it 'should validate presence of description' do
    should validate_presence_of(:description)
  end

  it 'should validate presence of location' do
    should validate_presence_of(:location)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.build(:expense)).to be_valid
  end
end
