class User < ActiveRecord::Base
  devise :database_authenticatable,
         :recoverable,
         :trackable,
         :validatable,
         :lockable,
         :timeoutable

  has_many :cars, as: :owner, dependent: :destroy
  has_many :vendors, as: :venderable, dependent: :destroy

  has_many :user_groups
  has_many :groups, through: :user_groups

  mount_uploader :avatar, AvatarUploader

  validates_presence_of :username, :first_name, :last_name
  validates_uniqueness_of :username

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  class << self
    def login(username_or_email, login_password, ip_address)
      if EMAIL_REGEX.match(username_or_email)
        user = User.find_by_email(username_or_email)
      else
        user = User.find_by_username(username_or_email)
      end

      if user && user.valid_password?(login_password)
        user.sign_in_count += 1
        user.last_sign_in_at = user.current_sign_in_at || nil
        user.last_sign_in_ip = user.current_sign_in_ip || nil
        user.current_sign_in_at = Time.now
        user.current_sign_in_ip = ip_address
        user.save!
        user
      else
        false
      end
      # TODO - Find a way to increment failed login count
    end
  end
end
