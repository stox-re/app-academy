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

cat3 = Cat.create(
  birth_date: Date.new(2018, 10, 15),
  color: "grey",
  name: "Frodo",
  sex: "M",
  description: "Frodo loves going for long hikes in the mountains, and playing with his ball. Give him lots of treats!"
)

cat4 = Cat.create(
  birth_date: Date.new(2018, 10, 15),
  color: "grey",
  name: "Malfoy",
  sex: "M",
  description: "Malfoy is a sneaky cat who likes to make mischief. He also loves playing with feathers."
)

rental1 = CatRentalRequest.create(
  cat_id: cat1.id,
  start_date: Date.new(2020, 3, 15),
  end_date: Date.new(2020, 11, 10),
  status: "PENDING"
)

rental2 = CatRentalRequest.create(
  cat_id: cat1.id,
  start_date: Date.new(2020, 12, 04),
  end_date: Date.new(2020, 12, 25),
  status: "APPROVED"
)

rental3 = CatRentalRequest.create(
  cat_id: cat2.id,
  start_date: Date.new(2020, 9, 14),
  end_date: Date.new(2020, 10, 05),
  status: "PENDING"
)