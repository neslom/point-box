require 'rails_helper'

RSpec.describe "User dashboard" do
  let!(:reward_1) { Reward.create(title: "car", worth: 1000) }

  let!(:reward_2) { Reward.create(title: "sandwich", worth: 50) }

  let(:user) { User.create(username: "markus", password: "password", available_points: 50, redeemed_points: 100) }

  let!(:redeemed_reward) { RedeemedReward.create(user_id: user.id, reward_id: reward_2.id) }

  before(:each) { login_as(user) }

  it "shows available points" do
    within("#user_points") do
      expect(page).to have_content("Available Points: 50")
    end
  end

  it "shows redeemed points" do
    within("#user_points") do
      expect(page).to have_content("Redeemed Points: 100")
    end
  end

  it "shows available rewards" do
    expect(page).to have_link("View Available Rewards")

    click_link_or_button("View Available Rewards")

    expect(current_path).to eq(rewards_path)
    expect(page).to have_content("car")
    expect(page).to have_content("sandwich")
  end

  context "#rewards" do

    it "shows redeemed rewards" do
      expect(page).to have_content("Your Rewards")

      within("#user_rewards") do
        expect(page).to have_content("sandwich")
      end
    end

    it "does not show unredeemed rewards" do
      within("#user_rewards") do
        expect(page).not_to have_content("car")
      end
    end

  end
end
