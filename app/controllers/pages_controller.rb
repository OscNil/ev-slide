class PagesController < ApplicationController
  before_action :find_available_posts

  def profile
    @user = current_user
    # initiate charging

    @charging_session = ChargingSession.new
    # ongoing charging
    @session = @user.charging_sessions.find_by(end_time: nil)
    # need to queue
    @queueing = Queueing.new
    # ongoing queue
    @my_ongoing_queueing = @user.queueings.find_by(end_time: nil)
    @my_number_in_queue = @user.my_number_in_queue
    # (ongoing queue and) parking slot is avaiable - your turn
    @my_turn = current_user.myturn?

    @no_queue = Queueing.no_queue?
  end

  def queue
  end

  def find_available_posts
    @available_posts = ChargingPost.available_posts
  end
end
