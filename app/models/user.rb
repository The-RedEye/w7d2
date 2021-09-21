class User < ApplicationRecord
  
  after_initialize :ensure_session_token
  
  validates :email, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :email, :password_digest, :session_token, presence: true

  attr_reader :password

  def self.generate_session_token
    self.session_token = SecureRandom::urlsafe_base64 
  end

  def generate_session_token
    self.session_token = SecureRandom::urlsafe_base64 
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def password=(password)
    self.password_digets = BCrypt::Password.new(password)
    @password = password
  end

  def is_password?
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)

    user && user.is_password?(password) ? user : nil
  end

end
