class ChargingSession < ApplicationRecord
  belongs_to :charging_post
  belongs_to :user
  validates :charging_post_id, presence: true
end
