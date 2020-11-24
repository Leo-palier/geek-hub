# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Game.create(name: 'Sonic', console: 'megadrive', year: 1992, price: 30)
Game.create(name: 'Mario', console: 'Nintendo', year: 1993, price: 25)
Game.create(name: 'Zelda', console: 'SuperNess', year: 1994, price: 40)
Game.create(name: 'MegaMan', console: 'megadrive', year: 1990, price: 20)
Game.create(name: 'GranTurismo', console: 'Playstation', year: 1997, price: 60)

User.create(username: 'Toto', email:'toto@gmail.com', first_name: 'Jean', last_name:'Bon')
User.create(username: 'Titi', email:'titi@gmail.com', first_name: 'Robert', last_name:'To')
User.create(username: 'Tutu', email:'tutu@gmail.com', first_name: 'Martin', last_name:'Nez')
