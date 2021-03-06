class QueueingsController < ApplicationController
  before_action :authenticate_user!
  def create
    @queueing = Queueing.new
    @queueing.user = current_user
    @queueing.start_time = Time.now.utc

    if @queueing.save
      redirect_to authenticated_root_path
    else
      redirect_to authenticated_root_path, alert: "issue with queueing creation"
    end
  end

  def update
    # to be used when you will get the chance to start using a charger
    # and when you decide to leave the queue
    @queueing = Queueing.find(params[:id])
    @queueing.end_time = Time.now.utc

    if @queueing.save
      redirect_to authenticated_root_path
    else
      redirect_to authenticated_root_path, alert: "issue with charging update"
    end
  end

  private

  def queueing_params
    params.require(:queueing).permit(:user_id, :start_time, :end_time)
  end
end
