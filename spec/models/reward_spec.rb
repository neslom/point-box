require 'rails_helper'

RSpec.describe Reward, type: :model do
  describe ".create" do
    it "is valid with title and worth" do
      reward = Reward.new(title: "car", worth: 1000)

      expect(reward).to be_valid
    end

    it "is invalid without a title" do
      reward = Reward.new(title: nil, worth: 1000)

      expect(reward).to be_invalid
    end

    it "is invalid without a worth" do
      reward = Reward.new(title: "car", worth: nil)

      expect(reward).to be_invalid
    end
  end
end
