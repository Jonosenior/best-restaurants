class Restaurant < ApplicationRecord
  has_many :dishes, dependent: :destroy
  geocoded_by :address
  after_validation :geocode

  validates :name, :description, :address, :cuisine, presence: true
end
