require 'spec_helper'

describe DiagnosticStatistic do
  it 'should belong to car' do
    should belong_to(:car)
  end

  it 'should validate presence of kmh' do
    should validate_presence_of(:kmh)
  end

  it 'should validate presence of l/100km' do
    should validate_presence_of(:l100km)
  end

  it 'should validate presence of rpm' do
    should validate_presence_of(:rpm)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.build(:diagnostic_statistic)).to be_valid
  end
end
