# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@shop = Shop.create!(name: "Evolution Bike Shop", rentals: TRUE, rank: 8)
@bike1 = Bike.create!(name: "Mega Bike", full_suspension: TRUE, travel_length: 180, shop_id: @shop.id)
@bike2 = Bike.create!(name: "Mini Bike", full_suspension: TRUE, travel_length: 90, shop_id: @shop.id)
