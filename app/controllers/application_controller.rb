class ApplicationController < ActionController::Base

  def time_stamp
    current_max_hours = 4
    # Change 3600 to 60 depending on if we want hours or minutes
    # Also change in charg_session and progressbar.js
    max_park_time = Time.at(current_max_hours * 3600)
    utc_offset = 3 * 3600
    @time_remaining = Time.at(max_park_time - (Time.now.utc - @session.start_time.utc) - utc_offset).strftime("%H:%M:%S")
  end

end
