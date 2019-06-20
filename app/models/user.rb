class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :charging_sessions
  has_many :queueings

  def self.myturn?
    joins(:charging_sessions).where(charging_sessions: { end_time: nil })
  end
end
