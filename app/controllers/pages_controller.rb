class PagesController < ApplicationController
  def home
  end

  def profile
    @user = current_user
    @session = @user.charging_sessions.find_by(end_time: nil)
  end
end
