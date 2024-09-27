class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :machine_usages
  has_many :reservations
  has_many :vehicles

end