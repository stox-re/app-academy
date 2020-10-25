class User < ApplicationRecord
  attr_reader :password

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: { message: 'Password can\'t be blank' }
  validates :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  def self.find_by_credentials(email, password)
    user_check = User.find_by({email: email})
    return nil if user_check == nil
    return user_check if user_check.is_password(password)
    return false
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def is_password(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end
end
