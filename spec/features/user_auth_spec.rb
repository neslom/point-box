require 'rails_helper'

RSpec.describe "User auth" do
  let!(:user_1) { User.create(username: "markus", password: "password", available_points: 50, redeemed_points: 100) }
  let!(:user_2) { User.create(username: "sally", password: "password", available_points: 50, redeemed_points: 100) }


  #before(:each) do
    #login_as(user_1)
    #allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)
  #end

  it "must be logged in to view user's page" do
    visit user_path(user_2)

    within("#flash_error") do
      expect(page).to have_content("Please login")
    end

    expect(current_path).to eq(login_path)
  end

  it "cannot view the admin pages" do
    login_as(user_1)

    visit admin_users_path

    expect(current_path).to eq(user_path(user_1))

    within("#flash_error") do
      expect(page).to have_content("Not authorized")
    end
  end
end
