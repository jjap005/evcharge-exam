class Location < ApplicationRecord
  belongs_to :city
  has_many :machines
  enum status: { active: 1, inactive: 0, blocked: 2, maintenance: 3 }

  scope :by_city, ->(city_id) {
    joins(:city).where(cities: { id: city_id })
  }

  validates :name, presence: true
  validates :address, presence: true
  validates :status, presence: true
end