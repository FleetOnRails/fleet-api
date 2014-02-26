require 'spec_helper'

describe Destination do
  it 'should belong to destinationable' do
    should belong_to(:destinationable)
  end

  it 'should have one locations' do
    should have_one(:location)
  end
end
