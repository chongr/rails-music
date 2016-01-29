class User < ActiveRecord::Base
  after_initialize :ensure_session_token

  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true

  def self.generate_session_token
      SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(email, password)
    user = User.where(email: email).first

    return user if user && user.is_password?(password)

  end

  def reset_session_token
    self.session_token = User.generate_session_token
    self.save!
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
