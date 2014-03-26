require 'spec_helper'

describe ServiceRecord do
  it 'should belong to car' do
    should belong_to(:car)
  end

  it 'should have many documents' do
    should have_many(:documents)
  end

  it 'should validate presence of odometer reading' do
    should validate_presence_of(:odometer_reading)
  end

  it 'should validate presence of technician' do
    should validate_presence_of(:technician)
  end

  it 'should validate presence of description' do
    should validate_presence_of(:description)
  end

  it 'should validate presence of location' do
    should validate_presence_of(:location)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.build(:service_record)).to be_valid
  end
end
