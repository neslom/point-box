class User < ActiveRecord::Base
  validates :username, presence: true
  validates :password, presence: true
  has_secure_password

  enum role: %w(default admin)
end
