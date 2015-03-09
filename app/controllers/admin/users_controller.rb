class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :is_admin?

  def index
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User points successfully updated"
      redirect_to (admin_users_path)
    else
      flash[:error] = "Unable to update"
      redirect_to (edit_admin_user_path(@user))
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :available_points, :redeemed_points)
  end

  def is_admin?
    if !current_user.admin?
      redirect_to user_path(current_user)
      flash[:error] = "Not authorized"
    end
  end
end
