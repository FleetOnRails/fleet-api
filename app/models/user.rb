require 'bcrypt'

class User < ActiveRecord::Base
  has_many :cars, as: :owner

  has_many :user_groups
  has_many :groups, through: :user_groups

  mount_uploader :avatar, AvatarUploader

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  validates_presence_of :email, :username, :first_name, :last_name
  validates_presence_of :password, on: :create
  validates_uniqueness_of :username, :email

  validates_format_of :email, with: EMAIL_REGEX

  before_create :encrypt_password
  after_create :clear_password

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
        user
      else
        false
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
