require 'rails_helper'

RSpec.describe "User dashboard" do
  Reward.create(title: "car", worth: 1000)
  Reward.create(title: "sandwich", worth: 50)
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

  it "shows available rewards" do
    expect(page).to have_link("View Available Rewards")

    click_link_or_button("View Available Rewards")

    expect(current_path).to eq(rewards_path)
    expect(page).to have_content("car")
    expect(page).to have_content("sandwich")
  end
end
