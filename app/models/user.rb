class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :charging_sessions
  has_many :queueings

  def self.myturn?(current_user)
    amount_available_posts = ChargingPost.amount_available_posts
    my_place_in_queue = User.my_place_in_queue(current_user)
    return false if my_place_in_queue.nil?

    amount_available_posts > my_place_in_queue
  end

  def self.ongoing_queue_in_order
    joins(:queueings).where(queueings: { end_time: nil }).order(start_time: :asc)
  end

  def self.my_place_in_queue(current_user)
    # note: the queue starts at zero
    ongoing_queue = User.ongoing_queue_in_order
    me_in_queue = ongoing_queue.where(id: current_user.id)
    ongoing_queue.find_index { |x| x == me_in_queue.first }
  end
end
