require 'spec_helper'

describe Vendor do
  it 'should belong to venderable' do
    should belong_to(:venderable)
  end

  it 'should have many products' do
    should have_many(:products)
  end

  it 'should have one location' do
    should have_one(:location)
  end

  it 'should validate presence of name' do
    should validate_presence_of(:name)
  end

  it 'should validate presence of supplies' do
    should validate_presence_of(:supplies)
  end

  it 'should validate presence of location' do
    should validate_presence_of(:location)
  end
end
