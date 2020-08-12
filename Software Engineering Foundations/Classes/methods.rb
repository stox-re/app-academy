# Instance Methods vs Class Methods
class Dog
  def initialize(name, bark)
    @name = name
    @bark = bark
  end

  def speak
    @name + " says " + @bark
  end
  def name
    @name
  end
  def self.growl
      "Grrrrr"
  end

  def yell_name
    p Dog.growl()
    #yell_name + " says hi."
    @name + " says hi." # can do either
  end

  def self.compare_dogs(dog1, dog2)
    return dog1.name.length > dog2.name.length ? dog1.name : dog2.name
  end

end

my_dog = Dog.new("Fidos", "woof")
my_dog.speak          # "Fido says woof"
other_dog = Dog.new("Doge", "much bork")
p other_dog.yell_name       # "Doge says much bork"

p Dog.compare_dogs(my_dog, other_dog)

# Speak is an instance method because we can only call it on an actual Dog instance
# after we initialized it with Dog.new()
# An instance method depends on the attributes or instance variables of an instance.
# For notation, we'll use Dog#speak to denote that speak is an instance method of Dog

# We define class methods by adding self to the front of a method name.
# self.growl is a class method and can be called on the class itself.
# For notation we'll use Dog::growl to denote that growl is an class method of Dog.