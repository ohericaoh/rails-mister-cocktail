# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_list = open(url).read

p ingredient_list
ingredients = JSON.parse(ingredient_list) # converts to ruby hash

# p ingredients['drinks']

ingredients_array = ingredients['drinks']

p ingredients['drinks']

# ingredients_array.each do |ingredient| #each ingredient hash
#   ingredient_name = ingredient['strIngredient1'] # key value
#   i = Ingredient.create!(name: ingredient_name) # created new instances of ingredients to put into db
#   puts "Created #{i.name}"
# end
