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


  xit "can edit a reward" do
    find_link("Edit Reward", href: edit_admin_reward_path(reward_1)).click

    expect(current_path).to eq(edit_admin_reward_path(reward_1))
    expect(reward_1.title).to eq("car")

    fill_in("reward[title]", with: "Beach trip")

    click_link_or_button("Update Reward")

    expect(reward_1.title).to eq("Beach trip")
    expect(current_path).to eq(admin_rewards_path)
  end

  it "can delete a reward" do
    expect(page).to have_content("car")
    expect(Reward.count).to eq(2)

    find_link("Delete Reward", href: admin_reward_path(reward_1)).click

    within("#flash_notice") do
      expect(page).to have_content("Reward successfully deleted")
    end

    expect(Reward.count).to eq(1)

  end
end
