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
end
