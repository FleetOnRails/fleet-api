require 'spec_helper'

describe DiagnosticFault do
  it 'should belong to car' do
    should belong_to(:car)
  end
end
