# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dog.destroy_all
dog1 = Dog.create(name: "Clifford the big red dog")
dog2 = Dog.create(name: "Snoopy")

Toy.destroy_all
toy1 = Toy.create(name: "Squishy toy", color: "red", dog_id: 11)
toy2 = Toy.create(name: "Dog bone", color: "blue", dog_id: 12)