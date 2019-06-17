class ChargingSessionsController < ApplicationController

  def show
    @session = ChargingSession.where(user_id: current_user.id, end_time: nil)
  end
  def create
    if ChargingSession.where(charging_post_id: params[:charging_post_id], end_time: nil)
      flash.now[:notice] = "Charger taken! Won't do anything."
    else
      @session = ChargingSession.new(session_params)
      @session.charging_post = ChargingPost.find(params[:charging_post_id])
      @session.user = current_user
      @session.start_time = Date.new

      if @session.save
        redirect_to user_path
      else
        # The same as above...no updates.
        render "user/show"
      end
    end
  end

  def update
    @session = ChargingSession.find(params[:charging_post_id])
    @session.end_time = Date.new

    if @session.update(session_params)
      redirect_to user_path
    else
      # The same as above...no updates.
      render "user/show"
    end
  end

  private

  def session_params
    params.require(:charging_session).permit(:charging_post_id, :user_id, :start_time, :end_time)
  end
end
