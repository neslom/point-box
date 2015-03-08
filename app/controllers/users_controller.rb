class UsersController < ApplicationController
  def show
    @rewards = Reward.all
  end
end
