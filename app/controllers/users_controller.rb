class UsersController < ApplicationController
  before_action :logged_in?

  def show
  end

  def update
  end

  private

  def logged_in?
    if !current_user
      flash[:error] = "Please login first"
      redirect_to login_path
    end
  end
end
