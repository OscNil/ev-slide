class PagesController < ApplicationController
  def profile
    @user = current_user
    @session = @user.charging_sessions.find_by(end_time: nil)
    @available_posts = all_posts - occupied_posts
    @charging_session = ChargingSession.new
  end
end

private

def occupied_posts
  array_occupied = []
  occupied = ChargingSession.where(end_time: nil)
  occupied.each do |post|
    array_occupied << post.charging_post_id
  end

  return array_occupied
end

def all_posts
  array_all = []
  all = ChargingPost.all
  all.each do |post|
    array_all << post.id
  end
  return array_all
end
