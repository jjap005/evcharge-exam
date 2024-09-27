class Country < ApplicationRecord
    validates :name, presence: true
    validates :code, length: { is: 3 }, uniqueness: true
  end