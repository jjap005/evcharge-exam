class MachineUsage < ApplicationRecord
  belongs_to :machine
  belongs_to :user
  belongs_to :vehicle

  validates :start_time, presence: true
  validates :billed_amount, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :energy_used, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true


  def charging_in_progress?
    end_time.nil?
  end

  def charging_duration
    return nil if charging_in_progress?
    end_time - start_time
  end
end