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

  xit "can edit the users points" do
    find_link("Edit Points", href: edit_admin_user_path(user_1)).click

    expect(current_path).to eq(edit_admin_user_path(user_1))

    fill_in("user[available_points]", with: 77)
    #fill_in("user[password]", with: user_1.password_digest)

    hidden = find :xpath, "//input[@id='user_password']"
    hidden.set(user_1.password_digest)

    click_link_or_button("Update User")

    expect(current_path).to eq(admin_users_path)

    expect(user_1.available_points).to eq(77)
  end
end
