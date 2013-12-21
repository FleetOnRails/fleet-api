require 'bcrypt'

class User < ActiveRecord::Base
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates_presence_of :first_name, :last_name, :hashed_password

  validates_length_of :hashed_password, :in => 6..20, :on => :create
  validates :hashed_password, :confirmation => true

  before_save :encrypt_password
  after_save :clear_password

  #def self.authenticate(email)
  #  user = find_by_email(email)
  #  return nil if user.nil?
  #  return user #if user.has_password?
  #end

  def has_password?
    hashed_password == encrypt_password
  end

  def self.authenticate(username_or_email, login_password)
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

  def match_password(login_password)
    hashed_password == BCrypt::Engine.hash_secret(login_password, salt)
  end

  private

  def encrypt_password
    if hashed_password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password= BCrypt::Engine.hash_secret(hashed_password, salt)
    end
  end

  def clear_password
    self.hashed_password = nil
  end
end
