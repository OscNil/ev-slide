class ChargingSession < ApplicationRecord
  belongs_to :charging_post
  belongs_to :user
end
