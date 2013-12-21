class User < ActiveRecord::Base
  validates :email, :first_name, :last_name, :phone_no, :username, presence: true
end
