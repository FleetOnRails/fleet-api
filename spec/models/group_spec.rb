require 'spec_helper'

describe Group do
  it 'should have many users through memberships' do
    should have_many(:users).through(:memberships)
  end
end
