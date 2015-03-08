require 'rails_helper'

RSpec.describe "Rewards index page" do
  Reward.create(title: "Car", worth: 1000)
  Reward.create(title: "Sandwich", worth: 50)
  let(:user) { User.create(username: "markus", password: "password") }

  xit "has links to the rewards" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit rewards_path

    expect(page).to have_link("Redeem Reward", href: user_path(user))
    # will need to change above expectation
    #
    # might be best to RedeemedReward.create(user_id: params[:id], reward_id: reward.id)
    #   so the same reward isn't created in the Rewards table and same for Users
    #
    # of course will have to make sure the available points are there on the user, then convert
    # those points to redeemed if the join table entry is indeed created
    #
    # ALSO the Reward.create calls within the main describe block are stil present in the test DB
    # after the test. They are being cleaned out before each test run.

  end
end
