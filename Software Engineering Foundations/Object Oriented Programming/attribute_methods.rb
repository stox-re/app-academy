# Attribute methods
# Instead of manually implementing getters and setters

class Dog
    # attr_reader will define #name and #age getters for us
    # attr_reader :name, :age
    # attr_reader(:name, :age)
    # attr_writer :name, :age
    attr_accessor :name, :age

    def initialize(name, age, favorite_food)
        @name = name
        @age = age
        @favorite_food = favorite_food
    end
end

dog = Dog.new("Fido", 3, "pizza")
p dog.name
p dog.age
dog.name = "Spot"
dog.age += 1
p dog

# attr_reader creates getter methods automatically
# attr_writer creates setter methods automatically
# attr_accessor creates both getters and setters automatically