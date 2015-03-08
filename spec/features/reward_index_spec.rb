require 'rails_helper'

RSpec.describe "Rewards index page" do
  let!(:reward_1) { Reward.create(title: "Car", worth: 1000) }
  let!(:reward_2) { Reward.create(title: "Sandwich", worth: 50) }
  let!(:user) { User.create(username: "markus", password: "password", available_points: 900) }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit rewards_path
  end

  context "before the 'redeem reward' link has been clicked" do

    it "has links to the rewards" do
      expect(page).to have_link("Redeem Reward", href: redeemed_rewards_path(reward_id: reward_1.id, user_id: user.id))
      expect(page).to have_link("Redeem Reward", href: redeemed_rewards_path(reward_id: reward_2.id, user_id: user.id))
    end

  end

  context "when the 'redeem reward' link has been clicked" do
    context "when the User has enough available points" do

      it "creates redeemed reward" do
        expect(RedeemedReward.count).to eq(0)

        find_link("Redeem Reward", href: redeemed_rewards_path(reward_id: reward_2.id, user_id: user.id)).click

        within("#flash_notice") do
          expect(page).to have_content("The reward is now yours")
        end

        expect(RedeemedReward.count).to eq(1)
        expect(current_path).to eq(user_path(user))
      end

    end

    context "when the User does not have enough available points" do

      it "does not create redeemed reward" do
        expect(RedeemedReward.count).to eq(0)

        find_link("Redeem Reward", href: redeemed_rewards_path(reward_id: reward_1.id, user_id: user.id)).click

        within("#flash_notice") do
          expect(page).to have_content("Sorry, you don't have enough available points!")
        end

        expect(RedeemedReward.count).to eq(0)
        expect(current_path).to eq(rewards_path)
      end
    end

  end

end
