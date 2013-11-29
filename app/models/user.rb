class User < ActiveRecord::Base
  attr_accessible :address, :email, :first_name, :last_name, :password, :phone_number, :username

  validates :address, :email, :first_name, :last_name, :phone_number, :username, presence: true

end
