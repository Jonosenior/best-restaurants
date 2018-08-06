class Restaurant < ApplicationRecord
  has_many :dishes, dependent: :destroy

  validates :name, :description, :address, :cuisine, presence: true
end
