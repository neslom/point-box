class User < ActiveRecord::Base
  validates :username, presence: true
  validates :password, presence: true
  has_many :redeemed_rewards
  has_many :rewards, through: :redeemed_rewards
  has_secure_password

  enum role: %w(default admin)

  def convert_points(amount)
    decrement!(:available_points, amount)
    increment!(:redeemed_points, amount)
  end
end
