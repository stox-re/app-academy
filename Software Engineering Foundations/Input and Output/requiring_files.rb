# Requiring Files
# To seperate classes in files, you need to require them like so:

# Let's require the last two files, by specifying their path's relative to this pet_hotel.rb file
require_relative "./cat.rb"
require_relative "./other_animals/dog.rb"

class PetHotel
  def initialize(name)
    @name = name
    @guests = []
  end

  def check_in(guest)
    @guests << guest
  end
end

class Cat
  def initialize(name)
    @name = name
  end
end

hotel = PetHotel.new("Animal Inn")

cat_1 = Cat.new("Sennacy")
cat_2 = Cat.new("Whiskers")

hotel.check_in(cat_1)
hotel.check_in(cat_2)

p hotel

# project_root/cat.rb
class Cat
  def initialize(name)
    @name = name
  end
end
# project_root/other_animals/dog.rb
class Dog
  def initialize(name)
    @name = name
  end
end