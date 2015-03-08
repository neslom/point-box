class RedeemedReward < ActiveRecord::Base
  validates :user_id, presence: true
  validates :reward_id, presence: true
  belongs_to :user
  belongs_to :reward
end
