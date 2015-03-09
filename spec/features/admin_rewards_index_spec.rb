require 'rails_helper'

RSpec.describe "Admin Rewards Index" do
  let(:admin) { User.create(username: "Bob", password: "password", role: 1) }
  let!(:reward_1) { Reward.create(title: "car", worth: 1000) }
  let!(:reward_2) { Reward.create(title: "sandwich", worth: 50) }

  before(:each) do
    login_as(admin)
    visit admin_rewards_path
  end

  it "sees a list of existing rewards" do
    within("#current_rewards") do
      expect(page).to have_content("car")
      expect(page).to have_content("sandwich")
    end
  end
end
