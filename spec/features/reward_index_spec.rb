require 'rails_helper'

RSpec.describe "Rewards index page" do
  Reward.create(title: "Car", worth: 1000)
  Reward.create(title: "Sandwich", worth: 50)
  let(:user) { User.create(username: "markus", password: "password") }

  it "has links to the rewards" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit rewards_path

    expect(page).to have_link("Redeem Reward", href: user_path(user))

  end
end
