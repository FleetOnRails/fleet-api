require 'spec_helper'

describe UserGroup do
  it 'should belong to user' do
    should belong_to(:user)
  end

  it 'should belong to user' do
    should belong_to(:group)
  end
end
