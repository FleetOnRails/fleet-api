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
end
