class RedeemedRewardsController < ApplicationController
  def new
  end

  def create
    redeemed_reward = RedeemedReward.new(user_id: params[:user_id], reward_id: params[:reward_id])
    reward_worth = Reward.find(params[:reward_id]).worth

    if current_user.available_points >= reward_worth
      redeemed_reward.save
      current_user.convert_points(reward_worth)
      flash[:notice] = "The reward is now yours"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Sorry, you don't have enough available points!"
      redirect_to rewards_path
    end
  end

end
