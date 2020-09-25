# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

cat1 = Cat.create(
  birth_date: Date.new(2015, 2, 3),
  color: "grey",
  name: "Tommy",
  sex: "M",
  description: "Tommy is a happy little cat who loves to play with feathers."
)

cat2 = Cat.create(
  birth_date: Date.new(2018, 10, 15),
  color: "grey",
  name: "Sarah",
  sex: "F",
  description: "Sarah loves her scratching pole, and enjoys sleeping in the sun."
)