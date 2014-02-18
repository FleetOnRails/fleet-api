require 'spec_helper'

describe User do
  it 'validates presence of email' do
    should validate_presence_of(:email)
  end

  it 'validates presence of first_name' do
    should validate_presence_of(:first_name)
  end

  it 'validates presence of last_name' do
    should validate_presence_of(:last_name)
  end

  it 'validates presence of password' do
    should validate_presence_of(:password)
  end

  it 'validates uniqueness of email' do
    should validate_uniqueness_of(:email)
  end

  it 'validates uniqueness of username' do
    should validate_uniqueness_of(:username)
  end

  it 'validates confirmation of password' do
    should validate_confirmation_of(:password).with_message('Please provide password confirmation')
  end

  it 'validates length of password' do
    should ensure_length_of(:password).
               is_at_least(6).
               is_at_most(30)
  end

  it 'validates length of username' do
    should ensure_length_of(:username).
               is_at_least(3).
               is_at_most(20)
  end

  it 'validates email format' do
    should allow_value('alan@fleetonrails.eu', 'alankehoe111@gmail.com').for(:email)
    should_not allow_value('gmail.com', 'alan', '@gmail.com').for(:email)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.build(:user, password: 'password', password_confirmation: 'password')).to be_valid
  end
end
