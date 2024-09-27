class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :machine_usages

  enum status: { active: 0, inactive: 1 }

  validates :name, :brand, :model, :year, presence: true
  validates :year, numericality: { only_integer: true }
  validates :status, presence: true
end
