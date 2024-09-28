class Api::V1::LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :status

  has_many :machines
end