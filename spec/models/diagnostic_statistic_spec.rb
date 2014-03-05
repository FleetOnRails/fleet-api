require 'spec_helper'

describe DiagnosticStatistic do
  it 'should belong to car' do
    should belong_to(:car)
  end
end
