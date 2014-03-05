require 'spec_helper'

describe Location do
  it 'should belong to locationable' do
    should belong_to(:locationable)
  end
end
