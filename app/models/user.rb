require 'digest'

class User < ActiveRecord::Base
  attr_accessible :address, :email, :first_name, :last_name, :password, :phone_number, :username

  validates :address, :email, :first_name, :last_name, :phone_number, :username, presence: true

  def name
    [first_name, last_name].join ' '
  end

  def self.hashPassword(password)
    Digest::SHA256.hexdigest password
  end
end
