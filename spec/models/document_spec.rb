require 'spec_helper'

describe Document do
  it 'should belong to documentable' do
    should belong_to(:documentable)
  end

  it 'should validate presence of name' do
    should validate_presence_of(:name)
  end
end
