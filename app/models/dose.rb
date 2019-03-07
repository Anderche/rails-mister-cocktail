class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

	# validates :name, uniqueness: true, presence: true
 	validates :description, presence: true

	# A dose must have a description, a cocktail and an ingredient, and [cocktail, ingredient] pairings should be unique.
 	validates :cocktail, uniqueness: { scope: :ingredient }
end
