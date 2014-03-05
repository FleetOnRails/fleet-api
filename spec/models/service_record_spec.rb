require 'spec_helper'

describe ServiceRecord do
  it 'should belong to car' do
    should belong_to(:car)
  end

  it 'should have many documents' do
    should have_many(:documents)
  end
end
