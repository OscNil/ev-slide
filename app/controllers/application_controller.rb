class ApplicationController < ActionController::Base

  def time_stamp
    current_max_hours = 4
    max_park_time = Time.at(current_max_hours * 3600)
    utc_offset = 3 * 3600
    @time_remaining = Time.at(max_park_time - (Time.now.utc - @session.start_time.utc) - utc_offset).strftime("%H:%M:%S")
  end

end
