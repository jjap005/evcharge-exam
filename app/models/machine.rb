class Machine < ApplicationRecord
	belongs_to :location
	has_many :reservations

	enum status: { active: 0, inactive: 1, maintenance: 2, in_use: 4 }

	validates :name, :model, :supplier, presence: true
	validates :status, presence: true

	def available_for_reservation?(start_time, end_time)
    reservations.where("start_time < ? AND end_time > ?", end_time, start_time).none?
  end
end