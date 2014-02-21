require 'spec_helper'

describe Membership do
  it 'should belong to user model' do
    should belong_to(:user)
  end

  it 'should belong to group model' do
    should belong_to(:group)
  end
end
