require 'spec_helper'

describe GpsStatistic do
  it 'should belong to car' do
    should belong_to(:car)
  end

  it 'should validate presence of kmh' do
    should validate_presence_of(:kmh)
  end

  it 'should validate presence of latitude' do
    should validate_presence_of(:latitude)
  end

  it 'should validate presence of longitude' do
    should validate_presence_of(:longitude)
  end
end
