require "open-uri"
require "json"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")
url = URI.parse("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read

goodies = JSON.parse(url)

goodies['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end



COCKTAIL_URLS = ["https://images.pexels.com/photos/1304540/pexels-photo-1304540.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
'https://images.pexels.com/photos/1187766/pexels-photo-1187766.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
'https://images.pexels.com/photos/2093089/pexels-photo-2093089.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
'https://images.pexels.com/photos/2480828/pexels-photo-2480828.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
'https://images.pexels.com/photos/2167793/pexels-photo-2167793.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500']


COCKTAIL_URLS.each do |cocktail_url|
  cocktail = Cocktail.new(name:Faker::ProgrammingLanguage.name)
  cocktail.remote_photo_url = cocktail_url
  cocktail.save
end
