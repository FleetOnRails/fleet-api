require 'spec_helper'

describe Group do
  it 'should have many cars' do
    should have_many(:cars)
  end

  it 'should have many destinations' do
    should have_many(:destinations)
  end

  it 'should have many vendors' do
    should have_many(:vendors)
  end

  it 'should have many user groups' do
    should have_many(:user_groups)
  end

  it 'should have many users through user groups' do
    should have_many(:users).through(:user_groups)
  end

  it 'should validate presence of name' do
    should validate_presence_of(:name)
  end

  it 'should uniqueness of name' do
    should validate_uniqueness_of(:name)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.build(:group)).to be_valid
  end

  describe 'methods' do
    let(:user) { FactoryGirl.create(:user) }
    let(:group) { FactoryGirl.create(:group) }

    describe 'is_member?' do

      it 'returns true if user is a member' do
        group.add_user(user, REPORTER)

        expect(group.is_member?(user)).to be_true
      end

      it 'returns false if user is not a member' do
        expect(group.is_member?(user)).to be_false
      end
    end

    describe 'is_owner?' do

      it 'returns true if user is owner' do
        group.add_owner(user)

        expect(group.is_owner?(user)).to be_true
      end

      it 'returns false if user is manager' do
        group.add_user(user, MANAGER)

        expect(group.is_owner?(user)).to be_false
      end

      it 'returns false if user is driver' do
        group.add_user(user, DRIVER)

        expect(group.is_owner?(user)).to be_false
      end

      it 'returns false if user is reporter' do
        group.add_user(user, REPORTER)

        expect(group.is_owner?(user)).to be_false
      end
    end

    describe 'is_manager?' do

      it 'returns true if user is manager' do
        group.add_user(user, MANAGER)

        expect(group.is_manager?(user)).to be_true
      end

      it 'returns false if user is an owner' do
        group.add_owner(user)

        expect(group.is_manager?(user)).to be_false
      end

      it 'returns false if user is driver' do
        group.add_user(user, DRIVER)

        expect(group.is_manager?(user)).to be_false
      end

      it 'returns false if user is reporter' do
        group.add_user(user, REPORTER)

        expect(group.is_manager?(user)).to be_false
      end
    end

    describe 'is_driver?' do

      it 'returns true if user is driver' do
        group.add_user(user, DRIVER)

        expect(group.is_driver?(user)).to be_true
      end

      it 'returns false if user is an owner' do
        group.add_owner(user)

        expect(group.is_driver?(user)).to be_false
      end

      it 'returns false if user is driver' do
        group.add_user(user, MANAGER)

        expect(group.is_driver?(user)).to be_false
      end

      it 'returns false if user is reporter' do
        group.add_user(user, REPORTER)

        expect(group.is_driver?(user)).to be_false
      end
    end

    describe 'is_reporter?' do

      it 'returns true if user is reporter' do
        group.add_user(user, REPORTER)

        expect(group.is_reporter?(user)).to be_true
      end

      it 'returns false if user is an owner' do
        group.add_owner(user)

        expect(group.is_reporter?(user)).to be_false
      end

      it 'returns false if user is driver' do
        group.add_user(user, DRIVER)

        expect(group.is_reporter?(user)).to be_false
      end

      it 'returns false if user is manager' do
        group.add_user(user, MANAGER)

        expect(group.is_reporter?(user)).to be_false
      end
    end
  end
end
