class PagesController < ApplicationController
  before_action :find_available_posts

  def profile
    @user = current_user

    # 1. If the user is charging...
    @session = @user.charging_sessions.find_by(end_time: nil)

    # 2 + 3: If the user is in the queue...and if there is / is NOT a available post for the user
    @my_number_in_queue = @user.my_number_in_queue
    @my_ongoing_queueing = @user.queueings.find_by(end_time: nil)
    @my_turn = current_user.myturn?

    # If the user is NOT charging or NOT in queue..
    # 4...and there is a queue or no available charger posts
    # 5.. and charger post is available
    @no_queue = Queueing.no_queue?

    # initiate
    @charging_session = ChargingSession.new
    @queueing = Queueing.new
  end

  def queue
    @users_in_queue_in_order = User.users_in_queue_in_order
    @charging_sessions_start_times = ChargingSession.ongoing_start_times
    @no_queue = Queueing.no_queue?

  end

  def acdc
    @top_users_in_acdc_order = User.all.order(points: :desc).first(3)
    @bottom_users_in_acdc_order = User.all.order(points: :asc).first(3).reverse
  end

  def find_available_posts
    @available_posts = ChargingPost.available_posts
  end

  def queue_refresh
    @myturn = current_user.myturn?
    obj = { myturn: @myturn, userId: current_user.id }
    respond_to do |format|
      format.js { render json: obj }
    end
  end
end
