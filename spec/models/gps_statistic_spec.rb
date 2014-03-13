require 'spec_helper'

describe GpsStatistic do
  it 'should belong to car' do
    should belong_to(:car)
  end

  it 'should have one location' do
    should have_one(:location)
  end

  it 'should validate presence of kmh' do
    should validate_presence_of(:kmh)
  end

  it 'should validate presence of location' do
    should validate_presence_of(:location)
  end
end
