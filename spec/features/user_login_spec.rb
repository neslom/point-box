require 'rails_helper'

RSpec.feature "User logs in" do
  scenario "with valid username and password" do
    user = User.create(first_name: "Markus", last_name: "Olsen", password: "password", available_points: 10, redeemed_points: 0)

    visit login_path

    fill_in "session[first_name]", with: user.first_name
    fill_in "session[last_name]", with: user.last_name
    fill_in "session[password]", with: user.password
    click_link_or_button "Log in"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, Markus!")
  end
end
