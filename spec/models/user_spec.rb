require 'spec_helper'

describe User do
  it 'should have many user groups' do
    should have_many(:user_groups)
  end

  it 'should have many groups' do
    should have_many(:groups).through(:user_groups)
  end

  it 'should have many cars' do
    should have_many(:cars)
  end

  it 'should have many vendors' do
    should have_many(:vendors)
  end

  it 'validates presence of email' do
    should validate_presence_of(:email)
  end

  it 'validates presence of first_name' do
    should validate_presence_of(:first_name)
  end

  it 'validates presence of last_name' do
    should validate_presence_of(:last_name)
  end

  it 'validates uniqueness of email' do
    should validate_uniqueness_of(:email)
  end

  it 'validates uniqueness of username' do
    pending 'Why does this through an error ?'
    should validate_uniqueness_of(:username)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  describe 'login method' do
    let(:user) { FactoryGirl.create :user }
    let(:bob) { FactoryGirl.build :user }

    it 'should find a user for login with username' do
      expect(User.login user.username, user.password, '127.0.0.1').to eq(user)
    end

    it 'should find a user for login with email' do
      expect(User.login user.email, user.password, '127.0.0.1').to eq(user)
    end

    it 'should return false if user is not found' do
      expect(User.login bob.email, bob.password, '127.0.0.1').to eq(false)
    end
  end
end
