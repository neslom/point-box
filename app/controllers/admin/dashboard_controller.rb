class Admin::DashboardController < ApplicationController
  before_action :is_admin?, :index

  def index
  end

  private

  def is_admin?
    if !current_user.admin?
      redirect_to user_path(current_user)
      flash[:error] = "Not authorized"
    end
  end
end
