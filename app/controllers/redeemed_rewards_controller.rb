class RedeemedRewardsController < ApplicationController
  def new
  end

  def create
    redeemed_reward = RedeemedReward.new(user_id: params[:user_id], reward_id: params[:reward_id])

    if current_user.available_points > Reward.find(params[:reward_id]).worth
      redeemed_reward.save
      flash[:notice] = "The reward is now yours"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Sorry, you don't have enough available points!"
      redirect_to user_path(current_user)
    end
  end

  private

  def redeemed_reward_params
    params.require(:redeemed_reward).permit(:user_id, :reward_id)
  end
end
