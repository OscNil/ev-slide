class ChargingSession < ApplicationRecord
  belongs_to :charging_post
  belongs_to :user
  validates :charging_post_id, presence: true
  after_create :stop_queueing
  # scope :ongoing_sessions_by_start_time, -> { where(end_time: nil).order(start_time: :asc) }

  def self.ongoing_sessions_by_start_time
    # Array of Charging Session INstances
    where(end_time: nil).order(start_time: :asc)
  end

  def self.ongoing_start_times
    # Array of DateTime objects
    ongoing_sessions_by_start_time.map(&:start_time)
  end

  def time_left_string
    # Change 3600 to 60 depending on if we want hours or minutes
    # Also change in appl_controller and progressbar.js
    time_left = (4 * 60) - (Time.now - start_time)
    hours, seconds = time_left.divmod(3600)
    minutes, seconds = seconds.divmod(60)
    return [hours, minutes, seconds].map { |num| "%02d" % num }.join(":")
  end

  def stop_queueing
    my_queue = user.queueings.where(end_time: nil).first
    if my_queue
      my_queue.end_time = Time.now.utc
      my_queue.save
    end

    # if @queueing.save
    #   redirect_to authenticated_root_path, notice: "charging updated successfully"
    # else
    #   redirect_to authenticated_root_path, alert: "issue with charging update"
    # end
  end
end
