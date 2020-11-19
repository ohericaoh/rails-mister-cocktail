class Cocktail < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  # validates :description, presence: true

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
end

