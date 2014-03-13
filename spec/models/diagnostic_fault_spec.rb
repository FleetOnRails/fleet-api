require 'spec_helper'

describe DiagnosticFault do
  it 'should belong to car' do
    should belong_to(:car)
  end

  it 'should validate presence of fault code' do
    should validate_presence_of(:fault_code)
  end

  it 'should validate presence of status' do
    should validate_presence_of(:status)
  end
end
