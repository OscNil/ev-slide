class ChargingSessionsController < ApplicationController
  def create
    unless ChargingSession.where(charging_post_id: params[:charging_post_id], end_time: nil).empty?
      flash.now[:notice] = "Charger taken!"
    else

      @session = ChargingSession.new(session_params)
      @session.user = current_user
      @session.start_time = Time.now.utc

      if @session.save
        redirect_to authenticated_root_path, notice: "charging creation successfully"
      else
        redirect_to authenticated_root_path, alert: "issue with charging creation"
      end
    end
  end

  def update
    @session = ChargingSession.find(params[:id])
    @session.end_time = Time.now.utc

    if @session.save
      redirect_to authenticated_root_path, notice: "charging updated successfully"
    else
      redirect_to authenticated_root_path, alert: "issue with charging update"
    end
  end

  private

  def session_params
    params.require(:charging_session).permit(:charging_post_id, :user_id, :start_time, :end_time)
  end
end
