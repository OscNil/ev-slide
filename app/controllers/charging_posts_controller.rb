class ChargingPostsController < ApplicationController
  def self.amount_available_posts
    joins(:charging_sessions).where.not(charging_sessions: { end_time: nil }).distinct.count
  end
end
