require 'spec_helper'

describe GpsStatistic do
  it 'should belong to car' do
    should belong_to(:car)
  end

  it 'should have one location' do
    should have_one(:location)
  end
end
