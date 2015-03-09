class Admin::RewardsController < ApplicationController
  before_action :set_reward, only: [:edit, :update]

  def index
    @rewards = Reward.all
  end

  def edit
  end

  def update
    if @reward.update(reward_params)
      flash[:notice] = "Reward successfully updated"
      redirect_to (admin_rewards_path)
    else
      flash[:error] = "Unable to update"
      redirect_to (edit_admin_reward_path(@reward))
    end
  end

  private

  def set_reward
    @reward = Reward.find(params[:id])
  end

  def reward_params
    params.require(:reward).permit(:title, :worth)
  end
end
