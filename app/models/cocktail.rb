class Cocktail < ApplicationRecord
  has_many :doses, presence: true
end
