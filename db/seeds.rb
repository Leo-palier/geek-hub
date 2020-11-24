# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email:'toto@gmail.com', password: "toto13")
User.create(email:'titi@gmail.com', password: "titi13")
User.create(email:'tutu@gmail.com', password: "tutu13")

Game.create!(name: 'Sonic', console: 'megadrive', year: 1992, price: 30, user_id: 1)
Game.create!(name: 'Mario', console: 'Nintendo', year: 1993, price: 25, user_id: 2)
Game.create!(name: 'Zelda', console: 'SuperNess', year: 1994, price: 40, user_id: 1)
Game.create!(name: 'MegaMan', console: 'megadrive', year: 1990, price: 20, user_id: 3)
Game.create!(name: 'GranTurismo', console: 'Playstation', year: 1997, price: 60, user_id: 2)