class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:edit]
  def index
    @users = User.all
  end

  def edit
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
