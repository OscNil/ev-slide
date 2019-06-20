class ChargingPost < ApplicationRecord
  has_many :charging_sessions
  scope :availableXX, -> { joins(:charging_sessions).where.not(charging_sessions: { end_time: nil }).distinct }

  def self.amount_available_posts
    joins(:charging_sessions).where.not(charging_sessions: { end_time: nil }).distinct.count
  end

  def self.available
    ChargingPost.all - ChargingPost.joins(:charging_sessions).where(charging_sessions: { end_time: nil }).order(:id).distinct
  end
end
