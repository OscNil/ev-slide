class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :charging_sessions
  has_many :queueings

  def self.users_in_queue_in_order
    joins(:queueings).where(queueings: { end_time: nil }).order(start_time: :asc)
  end

  def myturn?
    return false if my_place_in_queue.nil?

    amount_available_posts = ChargingPost.amount_available_posts
    amount_available_posts > my_place_in_queue
  end

  def my_number_in_queue
    # should never show/use 999 but for done for safety
    return 999 if my_place_in_queue.nil?

    my_place_in_queue + 1
  end

  private

  def my_place_in_queue
    # note: the queue starts at zero
    queue_of_users = User.users_in_queue_in_order
    # my_queueing = Queueing.where(user_id: id)
    my_queueing = queue_of_users.where(id: id)
    queue_of_users.find_index { |x| x == my_queueing.first }
  end
end
