require 'rails_helper'

RSpec.describe RedeemedReward, type: :model do
  let(:redeemed_reward) { RedeemedReward.new(user_id: 1, reward_id: 1) }

  it "is valid with user_id and reward_id" do
    expect(redeemed_reward).to be_valid
  end

  it "is invalid with no user_id" do
    redeemed_reward.user_id = nil

    expect(redeemed_reward).not_to be_valid
  end

  it "is invalid with no reward_id" do
    redeemed_reward.reward_id = nil

    expect(redeemed_reward).to be_invalid
  end
end
