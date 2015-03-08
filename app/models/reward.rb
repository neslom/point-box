class Reward < ActiveRecord::Base
  validates :title, presence: true
  validates :worth, presence: true
  has_many :redeemed_rewards
  has_many :users, through: :redeemed_rewards
end
