class ChargingSession < ApplicationRecord
  belongs_to :charging_post
  belongs_to :user
  validates :charging_post_id, presence: true

  def time_left_string
    # Change 3600 to 60 depending on if we want hours or minutes
    # Also change in appl_controller and progressbar.js
    time_left = (4 * 3600) - (Time.now - start_time)
    hours, seconds = time_left.divmod(3600)
    minutes, seconds = seconds.divmod(60)
    return [hours, minutes, seconds].map { |num| "%02d" % num }.join(":")
  end
end
