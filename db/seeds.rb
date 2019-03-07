# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

# ############ OPTIONAL #############

require 'open-uri' # Needed to open web urls
require 'json'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

to_add = JSON.parse(open(url).read)

drinks = to_add['drinks']

puts drinks

puts 'Creating ingredients...'
30.times do |n|
	  ingredients = Ingredient.new(
	    name:    drinks[n].values[0],
	  )
	  ingredients.save!
  p drinks[n].values[0]
end

puts 'Finished!'
