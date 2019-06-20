class ChargingSession < ApplicationRecord
  belongs_to :charging_post
  belongs_to :user
  validates :charging_post_id, presence: true

  def time_left_string
    time_left = (4 * 3600) - (Time.now - start_time)
    hours, seconds = time_left.divmod(3600)
    minutes, seconds = time_left.divmod(60)
    return [hours, minutes, seconds].map { |num| "%02d" % num }.join(":")
  end
end
