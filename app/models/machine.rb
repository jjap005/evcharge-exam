class Machine < ApplicationRecord
	belongs_to :location
	has_many :reservations

	enum status: { active: 1, inactive: 0, maintenance: 2, in_use: 4 }

	validates :name, :model, :supplier, presence: true
	validates :status, presence: true

	def available_for_reservation?(start_time, end_time)
    self.reservations.where(
      "(start_time < ? AND end_time > ?) OR
      (start_time >= ? AND start_time < ?) OR
      (end_time > ? AND end_time <= ?)",
      end_time, start_time, start_time, end_time, start_time, end_time
    ).count != 0
  end
end