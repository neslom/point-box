require 'rails_helper'

RSpec.describe "User dashboard" do
  let(:user) { User.create(username: "markus", password: "password", available_points: 50, redeemed_points: 100) }

  it "shows available and redeemed points" do
    login_as(user)

    within("#user_points") do
      expect(page).to have_content("Available Points: 50")
    end
  end
end
