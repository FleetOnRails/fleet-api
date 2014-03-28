require 'spec_helper'

describe Car do
  it 'should belong to owner' do
    should belong_to(:owner)
  end

  it 'should have many diagnostic statistics' do
    should have_many(:diagnostic_statistics)
  end

  it 'should have many diagnostic faults' do
    should have_many(:diagnostic_faults)
  end

  it 'should have many expenses' do
    should have_many(:expenses)
  end

  it 'should have many documents' do
    should have_many(:documents)
  end

  it 'should validate presence of make' do
    should validate_presence_of(:make)
  end

  it 'should validate presence of model' do
    should validate_presence_of(:model)
  end

  it 'should validate presence of registration' do
    should validate_presence_of(:registration)
  end

  it 'should validate uniqueness of registration' do
    should validate_uniqueness_of(:registration)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.build(:car)).to be_valid
  end

  describe 'methods' do
    let(:car) { FactoryGirl.create(:car) }
    let(:diagnostic_statistic) { FactoryGirl.create(:diagnostic_statistic) }
    let(:gps_statistic) { FactoryGirl.create(:gps_statistic) }

    describe 'add_diagnostic_statistic' do
      it 'should add a diagnostic statistic to a car' do
        car.add_diagnostic_statistic(diagnostic_statistic)

        expect(car.diagnostic_statistics.length).to eq(1)
      end

      # FIXME - Make these tests work, or is it a bug
      it 'should limit number of diagnostic statistics to 30000' do
        pending
        #car.stub_chain(:diagnostic_statistics, :length) { 20000 }
        (1..30001).each do
          car.add_diagnostic_statistic(diagnostic_statistic)
        end

        expect(car.diagnostic_statistics.length).to eq(29900)
      end
    end

    describe 'add_gps_statistic' do
      it 'should add a gps statistic to a car' do
        car.add_gps_statistic(gps_statistic)

        expect(car.gps_statistics.length).to eq(1)
      end

      # FIXME - Make these tests work, or is it a bug
      it 'should limit number of gps statistics to 30000' do
        pending
        #car.stub_chain(:gps_statistics, :length) { 20000 }
        (1..30001).each do
          car.add_gps_statistic(gps_statistic)
        end

        expect(car.gps_statistics.length).to eq(29900)
      end
    end
  end
end
