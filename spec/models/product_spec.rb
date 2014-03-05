require 'spec_helper'

describe Product do
  it 'should belong to productable' do
    should belong_to(:productable)
  end
end
