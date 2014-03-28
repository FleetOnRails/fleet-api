require 'spec_helper'

describe Reminder do
  it 'should belong to car' do
    should belong_to(:car)
  end

  it 'should validate presence of date' do
    should validate_presence_of(:date)
  end

  it 'should validate presence of odometer' do
    should validate_presence_of(:odometer)
  end

  it 'should validate presence of reminder type' do
    should validate_presence_of(:reminder_type)
  end

  it 'should validate presence of description' do
    should validate_presence_of(:description)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.build(:reminder)).to be_valid
  end
end
