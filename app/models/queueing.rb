class Queueing < ApplicationRecord
  belongs_to :user

  def self.no_queue?
    where(end_time: nil).empty?
  end
end
