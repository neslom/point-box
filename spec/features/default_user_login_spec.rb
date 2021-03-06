require 'rails_helper'

RSpec.feature "Default User login" do
    scenario "logs in with valid username and password" do
      user = User.create(username: "molsen", password: "password")

      visit login_path

      fill_in "session[username]", with: user.username
      fill_in "session[password]", with: user.password
      click_link_or_button "Log in"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Logged in as molsen")
      expect(page).not_to have_content("Invalid login")
    end

    scenario "login fails with invalid username" do
      user = User.create(username: nil, password: "password")

      visit login_path

      fill_in "session[username]", with: user.username
      fill_in "session[password]", with: user.password
      click_link_or_button "Log in"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid login")
    end

    scenario "login fails with invalid password" do
      user = User.create(username: nil, password: "password")

      visit login_path

      fill_in "session[username]", with: user.username
      fill_in "session[password]", with: user.password
      click_link_or_button "Log in"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid login")
    end

    scenario "clicks logout link to logout" do
      user = User.create(username: "molsen", password: "password")

      login_as(user)

      expect(page).to have_link("Logout", href: logout_path)

      click_link_or_button("Logout")

      expect(current_path).to eq(login_path)

      within("#flash_notice") { expect(page).to have_content("You have been logged out") }
    end
end
