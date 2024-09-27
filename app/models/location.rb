class Location < ApplicationRecord
  belongs_to :city
  enum status: { active: 0, inactive: 1, blocked: 2, maintenance: 3 }

  validates :name, presence: true
  validates :address, presence: true
  validates :status, presence: true
end