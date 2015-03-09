require 'rails_helper'

RSpec.describe "Admin auth" do
  let!(:admin) { User.create(username: "markus", password: "password", role: 1) }
  let!(:user) { User.create(username: "sally", password: "password", available_points: 300, redeemed_points: 100) }

  it "cannot be viewed by default user" do
    login_as(user)

    visit admin_path

    within("#flash_error") do
      expect(page).to have_content("Not authorized")
    end

    expect(current_path).to eq(user_path(user))
  end

  it "can view users pages" do
    login_as(admin)

    visit user_path(user)

    expect(page).to have_content("Your Rewards")
  end
end
