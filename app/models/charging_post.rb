class ChargingPost < ApplicationRecord
  has_many :charging_sessions
  scope :available, -> { joins(:charging_sessions).where.not(charging_sessions: { end_time: nil } ) }

  def self.available_posts
    joins(:charging_sessions).where.not(charging_sessions: { end_time: nil })
  end
end
