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



require 'open-uri' # Needed to open web urls
require 'json'

# SEED the COCKTAILS

url = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'
items_serialized = open(url).read
items = JSON.parse(items_serialized)["drinks"]

items.each do |item|
  Cocktail.create( name: item["strDrink"] )
  p item["strDrink"]

end

# SEED the INGREDIENTS

url_ing = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
to_add_drinks = JSON.parse(open(url_ing).read)
drinks = to_add_drinks['drinks']

puts 'Creating ingredients...'
30.times do |n|
	  ingredients = Ingredient.new(
	    name:    drinks[n].values[0],
	  )
	  ingredients.save!
  p drinks[n].values[0]
end

puts 'Finished!'
