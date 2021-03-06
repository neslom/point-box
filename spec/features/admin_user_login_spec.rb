require 'rails_helper'

RSpec.feature "Admin dashboard" do
  let(:admin) { User.create(username: "Bob", password: "password", role: 1) }

  scenario "logs in and is taken to admin dashboard" do

    expect(admin.role).to eq("admin")

    login_as(admin)

    expect(current_path).to eq(admin_path(admin))

    within("h1") do
      expect(page).to have_content("Administration")
    end

    within("h3") do
      expect(page).to have_content("Logged in as Bob")
    end
  end

  scenario "has link to manage user points" do
    login_as(admin)

    expect(page).to have_link("Manage User Points", href: admin_users_path)

    click_link_or_button("Manage User Points")

    expect(current_path).to eq(admin_users_path)
  end

  scenario "has link to manage rewards" do
    login_as(admin)

    expect(page).to have_link("Manage Rewards", href: admin_rewards_path)

    click_link_or_button("Manage Rewards")

    expect(current_path).to eq(admin_rewards_path)
  end
end
