class Country < ApplicationRecord
  has_many :regions


  validates :name, presence: true
  validates :code, presence: true, uniqueness: true
end