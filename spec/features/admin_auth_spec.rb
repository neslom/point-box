require 'rails_helper'

RSpec.describe "Admin auth" do
  let!(:admin_1) { User.create(username: "markus", password: "password", role: 1) }
  let!(:admin_2) { User.create(username: "sally", password: "password", role: 1) }


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
end
