require 'spec_helper'

describe Document do
  it 'should belong to documentable' do
    should belong_to(:documentable)
  end
end
