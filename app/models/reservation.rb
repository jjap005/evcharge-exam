class Reservation < ApplicationRecord
  belongs_to :machine
  belongs_to :user
  belongs_to :vehicle, optional: true

  enum status: { pending: 0, confirmed: 1, canceled: 2 }

  validates :start_time, :end_time, presence: true
  validate :validate_time_range
  validates :status, presence: true

  def validate_time_range
    if end_time <= start_time
      errors.add(:end_time, "must be after the start time")
    end
  end
end