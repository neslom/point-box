require 'rails_helper'

RSpec.describe "User dashboard" do
  let(:user) { User.create(username: "markus", password: "password", available_points: 50, redeemed_points: 100) }
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

  xit "shows available rewards" do
    reward_1 = Reward.create(title: "car", worth: 1000)
    reward_2 = Reward.create(title: "sandwich", worth: 50)

    within("#available_rewards") do
      expect(page).to have_content("car")
    end
  end
end
