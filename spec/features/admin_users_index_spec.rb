require 'rails_helper'

RSpec.describe "Admin Users Index" do
  let(:admin) { User.create(username: "Bob", password: "password", role: 1) }
  let!(:user_1) { User.create(username: "molsen", password: "password", available_points: 1000, redeemed_points: 500) }
  let!(:user_2) { User.create(username: "sally", password: "password", available_points: 1000, redeemed_points: 500) }

  before(:each) do
    login_as(admin)
    visit admin_users_path
  end

  it "sees a list of users" do
    expect(page).to have_content("sally")
  end
end
