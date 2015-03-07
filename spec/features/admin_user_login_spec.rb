require 'rails_helper'

RSpec.feature "Admin login" do
  scenario "is taken to admin dashboard" do
    admin = User.create(username: "Bob", password: "password", role: 1)

    expect(admin.role).to eq("admin")

    visit login_path

    fill_in "session[username]", with: admin.username
    fill_in "session[password]", with: admin.password
    click_link_or_button "Log in"

    expect(current_path).to eq(admin_path(admin))
  end
end
