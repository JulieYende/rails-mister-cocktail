Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

uri = URI.parse(url)
response = uri.open.read
r = JSON.parse(response)

r["drinks"].each do |ingredient|
 Ingredient.create!(name: ingredient["strIngredient1"])
end
puts "Ingredients done"

drinks = ["Coffee Sip", "Milk Blood", "Red Riddle", "Garlic Wacker",
"Sanguine Grog", "Brilliant Light Ale", "Green Roar", "Pineapple Lagoon",
"Grapefruit Dark Beer", "Gin Giant", "Spring Petal", "Pink Sunset",
"Silent Thriller", "Low Velvet", "Minty Crush", "Gin Breeze", "Tiny Duke",
"Noxious Rum", "Passion Fruit Paralyzer", "Silent Fluffy"]

drinks.each do |drink|
 Cocktail.create!(name: "#{drink}")
end
puts "Cocktails done"

20.times do
 Dose.create!(
   description: "#{rand(1..10)} cl",
   cocktail:  Cocktail.order("RANDOM()").first,
   ingredient: Ingredient.order("RANDOM()").first
 )
end
puts "Doses OK"
