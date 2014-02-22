require 'bcrypt'

class User < ActiveRecord::Base
  has_and_belongs_to_many :groups

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  validates_presence_of :email, :username, :first_name, :last_name, :password
  validates_uniqueness_of :username, :email

  validates_confirmation_of :password, on: :create, message: 'Please provide password confirmation'

  validates_length_of :username, in: 3..20

  validates_format_of :email, with: EMAIL_REGEX

  before_save :encrypt_password
  after_save :clear_password

  def has_password?
    password == encrypt_password
  end

  class << self
    def authenticate(username_or_email, login_password)
      if EMAIL_REGEX.match(username_or_email)
        user = User.find_by_email(username_or_email)
      else
        user = User.find_by_username(username_or_email)
      end

      if user && user.match_password(login_password)
        return user
      else
        return false
      end
    end
  end

  def match_password(login_password)
    password == BCrypt::Engine.hash_secret(login_password, salt)
  end

  private

  def encrypt_password
    unless salt
      if password.present?
        self.salt = BCrypt::Engine.generate_salt
        self.password= BCrypt::Engine.hash_secret(password, salt)
      end
    end
  end

  def clear_password
    self.password = nil
  end
end
