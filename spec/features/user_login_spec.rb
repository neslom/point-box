require 'rails_helper'

RSpec.feature "User logs in" do
  scenario "with valid username and password" do
    user = User.create(username: "molsen", password: "password", available_points: 10, redeemed_points: 0)

    visit login_path

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password
    click_link_or_button "Log in"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, molsen!")
  end
end
