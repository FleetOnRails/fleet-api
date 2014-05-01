class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  # FIXME - Why do Devise's validations not work.
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

  validates_presence_of :username, :first_name, :last_name

  validates_uniqueness_of :username
  validates_uniqueness_of :email

  before_save :hash_gravatar

  def send_registration_mail
    Pony.mail({
                  :to => email,
                  :body => "Thanks for registering #{first_name} #{last_name}"
              })
  end

  def hash_gravatar
    self.gravatar_hash = Digest::MD5.hexdigest email
  end

  class << self
    EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

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
