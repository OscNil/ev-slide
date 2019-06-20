class PagesController < ApplicationController
  def profile
    @user = current_user
    # initiate charging
    @available_posts = ChargingPost.available
    @charging_session = ChargingSession.new
    # ongoing charging
    @session = @user.charging_sessions.find_by(end_time: nil)
    # standing in the queue
    @queueing = Queueing.new
    # ongoing queue
    @queueing_ongoing = @user.queueings.find_by(end_time: nil)
    # (ongoing queue and) parking slot is avaiable - your turn
    @my_turn = User.myturn?(current_user)
  end
end
