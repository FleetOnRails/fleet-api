require 'spec_helper'

describe FuelEntry do
  it 'should belong to car' do
    should belong_to(:car)
  end

  it 'should have one location' do
    should have_one(:location)
  end

  it 'should validate presence of odometer' do
    should validate_presence_of(:odometer)
  end

  it 'should validate presence of liters' do
    should validate_presence_of(:liters)
  end

  it 'should validate presence of price' do
    should validate_presence_of(:price)
  end

  it 'should validate presence of filling station' do
    should validate_presence_of(:fuel_type)
  end

  it 'should validate presence of filled tank' do
    should validate_presence_of(:filling_station)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.build(:fuel_entry)).to be_valid
  end
end
