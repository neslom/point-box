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
    within("#current_users") do
      expect(page).to have_content("sally")
      expect(page).to have_content("molsen")
    end
  end

  it "can edit the users points" do
    find_link("Edit Points", href: edit_admin_user_path(user_1)).click

    expect(current_path).to eq(edit_admin_user_path(user_1))
  end
end
